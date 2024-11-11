import 'package:flutter/material.dart';
import 'package:flutter_app_localizations_provider/localization/app_localization.dart';
import 'package:flutter_app_localizations_provider/pages/home_page.dart';
import 'package:flutter_app_localizations_provider/provider/current_data.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CurrentData currentData = CurrentData();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => currentData,
      child: Consumer<CurrentData>(
        builder: (BuildContext context, CurrentData provider, Widget? child) =>
            MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          locale: provider.locale,
          home: HomePage(),
          localizationsDelegates: const [
            AppLocalizationDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('vi'),
          ],
        ),
      ),
    );
  }
}
