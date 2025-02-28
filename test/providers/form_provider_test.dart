import 'package:dynamic_form_builder/data/model/dynamic_form_data_dto.dart';
import 'package:dynamic_form_builder/data/repository/api_repository.dart';
import 'package:dynamic_form_builder/providers/form_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'form_provider_test.mocks.dart';

@GenerateMocks([ApiRepository])
void main() {
  late MockApiRepository mockApiRepository;
  late FormProvider formProvider;

  setUp(() {
    mockApiRepository = MockApiRepository();
    formProvider = FormProvider(mockApiRepository);
  });

  test('getFormData sets data correctly', () async {

    final mockDto = DynamicFormDataDto(fields: [
      Fields(label: 'Test', name: 'test', type: 'text', props: Props(), style: Style())
    ]);

    when(mockApiRepository.fetchFormData()).thenAnswer((_) async => mockDto);

    expect(formProvider.isLoading, false);

    await formProvider.getFormData();

    verify(mockApiRepository.fetchFormData()).called(1);
    expect(formProvider.isLoading, false);
    expect(formProvider.dynamicFormDataDto, mockDto);
  });

  test('getFormData handles errors correctly', () async {

    when(mockApiRepository.fetchFormData()).thenThrow(Exception('Network error'));

    expect(formProvider.isLoading, false);

    await formProvider.getFormData();

    expect(formProvider.isLoading, false);
    expect(formProvider.dynamicFormDataDto, isNull);
  });
}
