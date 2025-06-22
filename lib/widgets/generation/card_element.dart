import 'package:flutter/material.dart';


class DeckRow extends StatelessWidget {
  final String deckType;
  final String? currentCard;
  final Color color;
  final VoidCallback onDrawPressed;

  DeckRow({super.key, 
    required this.deckType,
    required this.currentCard,
    required this.color,
    required this.onDrawPressed,
  });

  final Map<String, String> deckName = {
    'genre': 'Género',
    'setting': 'Mundo',
    'twist': 'Giro',
    'objective': 'Meta'
  };

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    deckName[deckType]!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    currentCard ?? 'No seleccionado',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            
            // Botón para sacar carta
            IconButton(
              onPressed: onDrawPressed,
              icon: Icon(Icons.casino, color: color),
              style: IconButton.styleFrom(
                backgroundColor: color.withAlpha(51),
              ),
            ),
          ],
        ),
      ),
    );
  }
}