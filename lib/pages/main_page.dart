import 'package:flutter/material.dart';
import 'package:gdesign/pages/about_page.dart';
import 'package:gdesign/pages/home_page.dart';
import 'package:gdesign/pages/library_page.dart';
import 'package:gdesign/pages/profile_page.dart';

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
    const ProfilePage(),
    const AboutPage()
  ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text('Game Design')),
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
            icon: Icon(Icons.home),
            label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Library'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile'),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About'),
        ]
      ),
    );
  }
}