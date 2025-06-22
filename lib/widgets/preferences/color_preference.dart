import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:gdesign/widgets/preferences/preference_tile.dart';

class ColorPreference extends StatelessWidget {
  final Color currentColor;
  final String category;
  final ValueChanged<Color> onColorChanged;

  ColorPreference({
    super.key,
    required this.currentColor,
    required this.category,
    required this.onColorChanged,
  });

  final Map<String, String> deckName = {
    'genre': 'género',
    'setting': 'mundo',
    'twist': 'giro',
    'objective': 'meta'
  };

  @override
  Widget build(BuildContext context) {
    return PreferenceTile(
      title: 'Color para ${deckName[category]}',
      trailing: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: currentColor,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey),
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Elegir color para ${deckName[category]}'),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: currentColor,
                onColorChanged: onColorChanged, // Guarda automáticamente
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Listo'),
              ),
            ],
          ),
        );
      },
    );
  }
}