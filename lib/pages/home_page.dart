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
  
  // Concept generator
  String concept = 'Tap to generate!';
  void generate() {
    setState(() {
      concept = ConceptGenerator().generateConcept();
      logger.d(concept);
    });
  }

  // Widget: Generator buttons
  ElevatedButton generatorButtons(String label, VoidCallback onPress)
  {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder()), // Para darle bordes cuadrados
      onPressed: onPress, 
      child: Text(label)
    );
  }

  // Widget: Concept generator
  Container generatorContainer(String concept) { 
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.red.shade200
        ),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              
              Text('Your game concept:'),

              // Empty space
              SizedBox(height: 20,),

              // Concept text
              SizedBox(
                height: 150,
                child:
                  Text(
                    concept,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  )
              ),
              
              // Empty space
              SizedBox(height: 20,),
              
              // Button row
              Row(
                children: [
                  Expanded(flex: 2, child: generatorButtons('Save', generate)),
                  SizedBox(width: 5),
                  Expanded(flex: 2, child: generatorButtons('Copy', generate)),
                  SizedBox(width: 5),
                  Expanded(flex: 3, child: generatorButtons('Generate', generate)),
                ],
              ),
            ],
          )
        )
      )
    );
  }


  // Widget: Changelog cards
  Card createChangelogCard(String title, String summary) {
    Card card = Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Align(alignment: Alignment.centerLeft, 
              child: 
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                )
            ),
            Row(
              children: [
                Icon(Icons.arrow_right),
                Text(summary)  
              ],
            ),
            
            FractionallySizedBox(
              widthFactor: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder()),
                onPressed: generate, 
                child: Text('Details')
              )
            )

            
          ],
        )
      )
    );
    return card;
  }


  @override
  Widget build(BuildContext context) {

    return Center(child: FractionallySizedBox(
      alignment: Alignment.center,
      widthFactor: 0.97,
      child: Padding(
      padding: const EdgeInsets.all(25),
      child: Center(
        child: Column(
          children: [

            // Generate section
            generatorContainer(concept),

            // Space between sections
            SizedBox(height: 32,),

            Expanded(
              child: Column(
                children: [
                  Text(
                    'Lastest updates',
                    style: TextStyle(
                      fontSize: 18
                    )
                    ),
                  
                  SizedBox(height: 10,),

                  Expanded(
                    child: Scrollbar(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              createChangelogCard("Update 1.3 Changelog", "Added new setting prompts."),
                              createChangelogCard("GDesign app now available on Desktop!", "Launched desktop vesion."),
                              createChangelogCard("Update 1.2 Changelog", "Added new subject prompts."),
                              createChangelogCard("Update 1.2 Changelog", "Added new genre prompts."),
                              createChangelogCard("Update 1.1 Changelog", "Fix generation bug.")
                            ],
                          )
                        )
                      )
                    )
                  )



                ],
              )
              
            )
          ]
        )
      )
    ))
    );
  }
}


class ConceptGenerator {

  List<String> gameGenres = [
    'A platformer game about ',
    'A first person shooter game about ',
    'A moba game about ',
    'A puzzle game about ',
    'A roguelike game about ',
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