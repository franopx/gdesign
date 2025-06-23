import 'package:flutter/material.dart';
import 'package:gdesign/pages/home_page.dart';
import 'package:gdesign/pages/library_page.dart';
import 'package:gdesign/pages/preferences_page.dart';
import 'package:gdesign/pages/about_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;

  List<Widget> pages = [
    const HomePage(),
    const LibraryPage(),
    const PreferencesPage(),
    const AboutPage(),

  ];

  @override
  Widget build(BuildContext context)
  {
    return PopScope(
      canPop: currentPage == 0,
      onPopInvokedWithResult: (bool didPop, result) {
          if (!didPop && currentPage != 0) {
            setState(() => currentPage = 0); // Navega al Home
          }
        },
      child: Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.casino),
            label: 'Inicio'),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Galería'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Preferencias'),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Acerca de'),
        ]
      ),
    ));
  }
}