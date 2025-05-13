import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<StatefulWidget> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  // Widgets here



  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text('About')
      )
    );
  }
}