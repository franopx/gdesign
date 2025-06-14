import 'package:flutter/material.dart';
import 'package:gdesign/pages/main_page.dart';
import 'package:gdesign/theme/theme.dart';
import 'package:gdesign/theme/util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    TextTheme textTheme = createTextTheme(context, "Montserrat", "Montserrat");
    
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'Game Design',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: const MainPage(),
    );
  }
}
