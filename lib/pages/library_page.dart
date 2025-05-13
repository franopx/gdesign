import 'package:flutter/material.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<StatefulWidget> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {

  void cardDetails() {}

  // Widget: Changelog cards
  Card createPromptCard(String title) {
    Card card = Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 5,),

              Expanded(
                child: Align(alignment: Alignment.topLeft, 
                  child: 
                    Text(
                      title,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                    )
                ),
              ),


              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder()),
                      onPressed: cardDetails, 
                      child: Text('Remove')
                    )
                  ),

                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder()),
                      onPressed: cardDetails, 
                      child: Text('Edit')
                    )
                  ),

                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder()),
                      onPressed: cardDetails, 
                      child: Text('Copy')
                    )
                  )

                ],
              ),
            ],
          )
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
        padding: const EdgeInsets.all(5),
        child: Center(
          child: Column(
            children: [
              
              SizedBox(height: 5,),

              const Text(
                'Prompt library',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                )
              ),

              SizedBox(height: 10),

              Expanded(

                child: Scrollbar(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          createPromptCard('An action game about cards uncovering an ancient prophecy.'),
                          createPromptCard('A puzzle game about a young hero collecting sacred artifacts.'),
                          createPromptCard('A platformer game about toys on a introspective journey.'),
                          createPromptCard('A roguelike game about toys destroying an evil empire.'),
                          createPromptCard('A puzzle game about racing cars uncovering an ancient prophecy.'),
                          createPromptCard('A moba game about racing cars discovering an unknown world.'),
                          createPromptCard('A first person shooter game about ninjas trying to save the world.'),
                          createPromptCard('A moba game about a robot traveling across the universe.'),
                        ],)
                  )),
                )
              ),

              FractionallySizedBox(
                widthFactor: 0.9,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder()),
                  onPressed: cardDetails, 
                  child: Text('Add manual prompt')
                )
              ),
              
            ],
          )
        )
      )
    ));
  }
}