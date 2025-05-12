import 'dart:math';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var logger = Logger();
  String concept = 'Tap to generate!';
  void generate() {
    setState(() {
      concept = ConceptGenerator().generateConcept();
      logger.d(concept);
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Center(
        child: Column(
          children: [
            // Generate Section
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(concept),
                    Icon(Icons.coffee),
                    TextButton(
                      onPressed: generate,
                      child: const Text('Generate')
                    )
                  ],
                )
              )
            ),
          ]
        )
      )
    );
  }
}

class ConceptGenerator {

  List<String> gameGenres = [
    'A platformer game about ',
    'A first person shooter game about ',
    'A moba game about ',
    'A puzzle game about ',
    'A rougelike game about ',
    'A role playing game about ',
    'An action game about ',
    'A hack and slash game about '
  ];

  List<String> gameSubjects = [
    'a group of heroes ',
    'a young hero ',
    'a magic creature ',
    'abstract shapes ',
    'cards ',
    'racing cars ',
    'toys ',
    'adventurers ',
    'a robot ',
    'pirates ',
    'ninjas '
  ];

  
  List<String> gameConcepts = [
    'trying to save the world.',
    'competing in a tournament.',
    'destroying an evil empire.',
    'discovering an unknown world.',
    'on a introspective journey.',
    'traveling across the universe.',
    'searching for a disappeared friend.',
    'playing a sport.',
    'collecting sacred artifacts.',
    'uncovering an ancient prophecy.'
  ];

  String generateConcept() {
    int genres = gameGenres.length;
    int subjects = gameSubjects.length;
    int concepts = gameConcepts.length;

    int genre = Random().nextInt(genres);
    int subject = Random().nextInt(subjects);
    int concept = Random().nextInt(concepts);

    return gameGenres[genre] + gameSubjects[subject] + gameConcepts[concept];
  }
}