import 'package:dynamic_form_builder/di/injector.dart';
import 'package:dynamic_form_builder/presentation/screens/home.dart';
import 'package:dynamic_form_builder/providers/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  setupDependencies();
  runApp(MultiProvider(providers: [ChangeNotifierProvider(create: (_) => getIt<FormProvider>())], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Form Builder',
      theme: ThemeData(
        fontFamily: 'Shabnam',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', ''),
        Locale('fa', ''),
      ],
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
