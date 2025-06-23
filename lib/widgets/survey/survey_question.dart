
import 'package:flutter/material.dart';

class SurveyQuestion extends StatefulWidget{
  const SurveyQuestion({
    super.key, 
    required this.title,
    required this.minLabel,
    required this.maxLabel,
    required this.onChanged,
    });

  final String title;
  final String minLabel;
  final String maxLabel;
  final void Function(int) onChanged;

  @override
  State<SurveyQuestion> createState() => _SurveyQuestionState();
}

class _SurveyQuestionState extends State<SurveyQuestion> {
  late int _value = 3;
  
  int getValue() {return _value;}

  @override
  Widget build(BuildContext context) {
  return Card(
        margin: EdgeInsets.only(bottom: 16),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.minLabel,
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    widget.maxLabel,
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Slider(
                value: _value.toDouble(),
                min: 1,
                max: 5,
                divisions: 4,
                label: _value.toString(),
                onChanged: (value) {
                  setState(() {
                    _value = value.toInt();
                  });
                  widget.onChanged(_value);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [1, 2, 3, 4, 5].map((num) {
                  return Text(num.toString());
                }).toList(),
              ),
            ],
          ),
        ),
      );
}
}