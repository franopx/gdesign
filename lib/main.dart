import 'package:flutter/material.dart';
import 'package:gdesign/domain/entities/app_data.dart';
import 'package:gdesign/domain/entities/preferences_manager.dart';
import 'package:gdesign/pages/main_page.dart';
import 'package:gdesign/theme/theme.dart';
import 'package:gdesign/theme/util.dart';
import 'package:gdesign/domain/entities/database_helper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper().initializeDatabase();

  final isDarkMode = await PreferencesManager.getDarkMode();

  runApp(MyApp(themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light));
}

class MyApp extends StatelessWidget {
  final ThemeMode themeMode;

  const MyApp({super.key, required this.themeMode});

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = createTextTheme(context, "Montserrat", "Montserrat");
    MaterialTheme theme = MaterialTheme(textTheme);
    return ChangeNotifierProvider<AppData>(
      create: (context) => AppData(),
      builder: (context, child) {
        return MaterialApp(
          title: 'Game Design',
          theme: context.watch<AppData>().dark_mode ? theme.dark() : theme.light(),
          home: const MainPage(),
        );
      }
    );
  }
}
