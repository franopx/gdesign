import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gdesign/widgets/survey/survey.dart';
import 'package:gdesign/widgets/survey/survey_question.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<StatefulWidget> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController groupController = TextEditingController();
  final TextEditingController relationController = TextEditingController();

  Map<String, List<Map<String, dynamic>>> _surveyAnswers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca de', style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer)), 
        backgroundColor: Theme.of(context).colorScheme.primaryContainer, foregroundColor: Theme.of(context).colorScheme.surface,),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('GDesign es una aplicación para crear conceptos de juegos que puedan ayudar en el proceso creativo para el diseño de videojuegos.'),
                SizedBox(height: 12,),
                Text('Desarrollador: Francisco Galeno'),
                Text('Contacto: fgaleno21@alumnos.utalca.cl'),
                SizedBox(height: 24,),
                Text('¡Deja tu opinión!', style: TextStyle(fontSize: 24),),

                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0), 
                    child: Column( children: [
                    Text('Identificación'),
                    Row(children: [
                      Text('Nombre:  '), 
                      Expanded(child: TextField(
                        controller: nameController,
                      ))
                      ],
                    ),
                    Row(children: [
                      Text('Grupo:  '), 
                      Expanded(child: TextField(
                        controller: groupController,
                      ))
                      ],
                    ),
                    Row(children: [
                      Text('Relación:  '), 
                      Expanded(child: TextField(
                        controller: relationController,
                      ))
                      ],
                    ),
                  ]
                  ),
                )),
                Survey(
                  onAnswersUpdated: (answers) {
                    setState(() {
                      _surveyAnswers = answers;
                    });
                  },
                ),
                SizedBox(height: 12),
                ElevatedButton(onPressed: _sendSurvey, child: const Text('Enviar'),),
              ],
            ),
          ),
        ),
    );
  }

    Future<void> _sendSurvey() async {
    if (nameController.text.isEmpty || 
        groupController.text.isEmpty || 
        relationController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor complete su información')),
      );
      return;
    }

    final surveyData = {
      'userInfo': {
        'name': nameController.text,
        'group': groupController.text,
        'relation': relationController.text,
      },
      'answers': _surveyAnswers,
    };

    await _sendEmail(surveyData);
  }

  Future<void> _sendEmail(Map<String, dynamic> data) async {
  try {
    final jsonString = jsonEncode(data);
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/formulario.json');
    await file.writeAsString(jsonString);

    await SharePlus.instance.share(
      ShareParams(
        files:[XFile(file.path)]
      ));
  } catch (e) {
    print('Error al crear o compartir el archivo: $e');
  }
  }
}