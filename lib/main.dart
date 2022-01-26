import 'package:flutter/material.dart';
// import 'package:flutter_application/pages/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_application/pages/tela_inicial.dart';

void main(List<String> args) {
  runApp(
    const MaterialApp(
      home: TelaInicial(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''),
        Locale('pt', 'BR'),
      ],
    ),
  );
}
