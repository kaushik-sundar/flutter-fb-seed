class AppState {
  static final AppState _singleton = new AppState._internal();

  factory AppState() {
    return _singleton;
  }
  AppState._internal();
  String version = "0.0.1";
  String codeName = "Maximus Madana";
}
