
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gdesign/widgets/survey/survey_question.dart';
import 'package:logger/web.dart';

class Survey extends StatefulWidget {
  final void Function(Map<String, List<Map<String, dynamic>>>) onAnswersUpdated;

  const Survey({
    required this.onAnswersUpdated,
    super.key,
  });

  @override
  State<Survey> createState() => _SurveyState();  
}

class _SurveyState extends State<Survey> {
  Map<String, dynamic> questions = {};
  late Map<String, List<Map<String, dynamic>>> _answers = {};



  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    final String response = await rootBundle.loadString('assets/questions.json');
    setState(() {
      questions = json.decode(response);
    });

    _answers = questions.map((category, questions) {
      return MapEntry(category, 
        (questions as List).map((q) => {
          'titulo': q['titulo'],
          'valor': 0, // Valor inicial
        }).toList()
      );
    });
  }

  void _updateAnswer(String category, int questionIndex, int value) {
    setState(() {
      _answers[category]![questionIndex]['valor'] = value;
    });
    widget.onAnswersUpdated(_answers);
  }

  // Widget _buildSurvey() {
  //   return ListView(
  //     shrinkWrap: true,
  //     physics: NeverScrollableScrollPhysics(),
  //     children: questions.entries.map((entry) {
  //       return Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
  //             child: Text(
  //               _getCategoryTitle(entry.key),
  //               style: TextStyle(
  //                 fontSize: 20,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ),
  //           ...entry.value.map((question) => SurveyQuestion(title: question['titulo'], minLabel: question['min'], maxLabel: question['max'],)).toList(),
  //           SizedBox(height: 24),
  //         ],
  //       );
  //     }).toList(),
  //   );
  // }

  String _getCategoryTitle(String key) {
    switch(key) {
      case 'usabilidad':
        return 'Sección de usabilidad';
      case 'contenido':
        return 'Sección de contenido';
      case 'compartir':
        return 'Sección de compartir';
      default:
        return key;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: questions.entries.map((entry) {
        return Column(
          children: [
            Text(entry.key, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...entry.value.asMap().entries.map((questionEntry) {
              final index = questionEntry.key;
              final question = questionEntry.value;
              return SurveyQuestion(
                title: question['titulo'],
                minLabel: question['min'],
                maxLabel: question['max'],
                onChanged: (value) => _updateAnswer(entry.key, index, value),
              );
            }).toList(),
          ],
        );
      }).toList(),
    );
  }
}

