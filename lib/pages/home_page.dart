
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'package:gdesign/widgets/generation/concept_generator.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var logger = Logger();
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('GDesign', style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer)), 
        backgroundColor: Theme.of(context).colorScheme.primaryContainer, foregroundColor: Theme.of(context).colorScheme.surface,),
      body: const ConceptGenerator()
    );
    
  }
}