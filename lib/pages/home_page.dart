import 'dart:math';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:gdesign/entity/generator.dart';
import 'package:gdesign/entity/prompt.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var logger = Logger();
  
  // Concept generator
  String concept = 'Tap to generate!';
  Image conceptIcon = Image.asset('assets/images/game/pistol.png', width: 64, height: 64,);
  void generate() {
    setState(() {
      
      Prompt generatedPrompt = Generator().generateConcept();

      concept = generatedPrompt.text;
      conceptIcon = generatedPrompt.icon;
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

              conceptIcon,
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
                  Expanded(
                    flex: 2, 
                    child: generatorButtons(
                      'Save', 
                      () {ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 1), content: Text('Prompt saved to Library!')),);})
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    flex: 2, 
                    child: generatorButtons(
                      'Copy', 
                      () {ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 1), content: Text('Prompt copied!')),);})
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    flex: 3, 
                    child: generatorButtons(
                      'Generate', 
                      generate)
                  ),
                ],
              ),
            ],
          )
        )
      )
    );
  }


  // Widget: Changelog cards
  Card createChangelogCard(BuildContext context, String title, String summary) {
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
                onPressed: () {showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Details'),
                    content: SizedBox(
                      width: 100, height: 100,
                      child: Column(
                        children: [Text(title, style: TextStyle(fontWeight: FontWeight.bold),), Text(summary)],
                      ),
                    ),
                    actions: [
                      TextButton(onPressed: () => Navigator.of(context).pop(), child: Text('OK'))
                    ],
                  )
                  );
                },
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
                              createChangelogCard(context, "Update 1.3 Changelog", "Added new setting prompts."),
                              createChangelogCard(context, "GDesign app now available on Desktop!", "Launched desktop vesion."),
                              createChangelogCard(context, "Update 1.2 Changelog", "Added new subject prompts."),
                              createChangelogCard(context, "Update 1.2 Changelog", "Added new genre prompts."),
                              createChangelogCard(context, "Update 1.1 Changelog", "Fix generation bug.")
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