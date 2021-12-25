import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:netguru_values/core/utils/theme.dart';
import 'package:netguru_values/features/netguru/app/pages/netguru_landing_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.system);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (context, ThemeMode currentTheme, _) {
          return MaterialApp(
            title: 'NetGuru Values Title',
            themeMode: currentTheme,
            theme: ThemeClass.lightTheme,
            darkTheme: ThemeClass.darkTheme,
            home: const NetGuruLandingPage(),
          );
        });
  }
}
