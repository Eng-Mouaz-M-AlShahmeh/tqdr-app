// Developed by: Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:tqdr/routes/routes.dart';
import 'package:tqdr/states/app_provider.dart';
import 'package:tqdr/states/invoice_provider.dart';
import 'package:tqdr/styles/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AppProvider>(
              create: (context) => AppProvider()),
          ChangeNotifierProvider<InvoiceProvider>(
              create: (context) => InvoiceProvider()),
        ],
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'تقدر',
            theme: appTheme,
            routes: routes,
            initialRoute: '/',
            locale: const Locale('ar', 'SA'),
            supportedLocales: const [Locale('ar', 'SA'), Locale('en', 'US')],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
          );
        });
  }
}
