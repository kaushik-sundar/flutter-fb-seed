import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

// Reference ***
// Article on configuring separate environemnts
// https://flutter.rocks/2018/03/02/separating-build-environments-part-one/

class AppConfig extends InheritedWidget {
  final String appName;
  final String flavorName;
  final ThemeData theme;
  final String apiBaseURL;
  final bool showPerformanceOverlay;

  AppConfig({
    @required this.appName,
    @required this.flavorName,
    @required this.theme,
    @required Widget child,
    @required this.apiBaseURL,
    this.showPerformanceOverlay,
  }) : super(child: child);

  static AppConfig of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppConfig);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
