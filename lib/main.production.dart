import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invest/main.dart';
import 'package:invest/shared/utils/AppConfig.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  var configuredApp = new AppConfig(
    appName: 'Flutter Firebase Seed',
    flavorName: 'production',
    apiBaseURL: '',
    theme: new ThemeData(),
    child: new MyApp(),
  );

  runApp(configuredApp);
}
