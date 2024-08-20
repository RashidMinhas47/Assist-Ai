
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appThemeStateNotifier = ChangeNotifierProvider((ref) => AppThemeState());

class AppThemeState with ChangeNotifier {
  var isDarkModeEnabled = false;
  void setDarkTheme() {
    isDarkModeEnabled = true;
    notifyListeners();
  }
void toggleTheme(){
    isDarkModeEnabled =!isDarkModeEnabled;
    notifyListeners();
}
  void setLightTheme() {
    isDarkModeEnabled = false;
    notifyListeners();
  }
}
