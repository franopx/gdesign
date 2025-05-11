import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Generate Section
          Container(
            color: Theme.of(context).primaryColor,
            child: Column(
              children: [
                Text('Generate'),
                Icon(Icons.coffee)
              ],
            )
          ),

        ]
        
        
      )
    );
  }
}