import 'package:dynamic_form_builder/data/repository/api_repository.dart';
import 'package:dynamic_form_builder/providers/form_provider.dart';
import 'package:dynamic_form_builder/webservice/api_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies()async {
  getIt.registerLazySingleton<ApiService>(() => ApiService());
  getIt.registerLazySingleton<ApiRepository>(() => ApiRepository(getIt<ApiService>()));
  getIt.registerLazySingleton<FormProvider>(() => FormProvider(getIt<ApiRepository>()));
}
