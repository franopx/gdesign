import 'package:flutter/material.dart';
import 'package:gdesign/entity/generator.dart';
import 'package:gdesign/entity/generator.dart';
import 'package:gdesign/entity/prompt.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<StatefulWidget> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {

  void cardDetails() {}

  // Widget: Changelog cards
  Card createPromptCard(BuildContext context) {
    Prompt prompt = Generator().generateConcept();
    String title = prompt.text;
    Image icon = prompt.icon;

    Card card = Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 5,),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  icon,
                  SizedBox(width: 5,),
                  Expanded(
                    child: Align(alignment: Alignment.topLeft, 
                      child: 
                        Text(
                          title,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                        )
                    ),
                  ),
              ],),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder()),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text('Remove prompt'),
                            content: Text('Are you sure you want to delete this prompt?\n\n$title'),
                            actions: [
                              TextButton(onPressed: () {Navigator.of(context).pop();}, child: Text('No')),
                              TextButton(onPressed: () {Navigator.of(context).pop();}, child: Text('Yes')),
                            ],)
                        );
                      }, 
                      child: Text('Remove')
                    )
                  ),

                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder()),
                      onPressed: () {ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 1), content: Text('Feature coming next update!')),);}, 
                      child: Text('Edit')
                    )
                  ),

                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder()),
                      onPressed: () {ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 1), content: Text('Prompt copied!')),);}, 
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
                          createPromptCard(context),
                          createPromptCard(context),
                          createPromptCard(context),
                          createPromptCard(context),
                          createPromptCard(context),


                        ],)
                  )),
                )
              ),

              FractionallySizedBox(
                widthFactor: 0.9,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder()),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('New prompt'),
                        content: 
                          SizedBox(width: 500, height: 300,
                            child:
                              Column(children: [
                                Row(children: [Text('Text: '), Text(' Write here...', style: TextStyle(color: Colors.blueGrey),)],),
                                Row(
                                  children: [Text('Icon: '), 
                                  DropdownButton<String>(
                                    value: '0',
                                    onChanged: (value) {},
                                    items: [
                                      DropdownMenuItem(value: '0', child: Text('idea')),
                                      DropdownMenuItem(value: '1', child: Text('sword')),
                                      DropdownMenuItem(value: '2', child: Text('gun')),
                                      DropdownMenuItem(value: '3', child: Text('puzzle')),
                                      DropdownMenuItem(value: '4', child: Text('jump'))
                                    ],
                                  )],)
                              ],)
                          ),
                        actions: [
                          TextButton(child: Text('Cancel'), onPressed: () {Navigator.of(context).pop();}),
                          TextButton(child: Text('Save'), onPressed: () {Navigator.of(context).pop();})
                        ],
                      )
                    );
                  }, 
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