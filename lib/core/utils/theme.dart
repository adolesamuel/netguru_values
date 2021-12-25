import 'package:flutter/material.dart';
import 'package:netguru_values/core/usecase/usecase.dart';
import 'package:netguru_values/core/utils/app_colors.dart';
import 'package:netguru_values/features/netguru/domain/repository/ng_value_repository.dart';
import 'package:netguru_values/features/netguru/domain/usecases/get_theme.dart';
import 'package:netguru_values/features/netguru/domain/usecases/save_theme.dart';
import 'package:netguru_values/injection_container.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: AppColor.netguruGreen,
    ),
    appBarTheme: const AppBarTheme(
      foregroundColor: AppColor.netguruGreen,
      backgroundColor: Colors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      colorScheme: const ColorScheme.dark(
        primary: AppColor.netguruGreen,
      ),
      appBarTheme: const AppBarTheme(
          foregroundColor: AppColor.netguruGreen,
          backgroundColor: Colors.black));
}

class ThemeChanger with ChangeNotifier {
  //get instance of theme from hive
  // 0 = system, 1 = light mode, 2 = dark mode

  NGValueRepository ngRepo = sl<NGValueRepository>();
  late GetTheme _getTheme;
  late SaveTheme _saveTheme;

  ThemeChanger() {
    _getTheme = GetTheme(ngRepo);
    _saveTheme = SaveTheme(ngRepo);
  }

  get getTheme => _getTheme(NoParams());

  setTheme(ThemeMode themeMode) async {
    if (themeMode == ThemeMode.system) {
      _saveTheme(const SaveThemeParams(0));
    } else if (themeMode == ThemeMode.light) {
      _saveTheme(const SaveThemeParams(1));
    } else if (themeMode == ThemeMode.dark) {
      _saveTheme(const SaveThemeParams(2));
    }
    notifyListeners();
  }
}
