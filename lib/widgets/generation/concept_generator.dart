import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gdesign/domain/entities/preferences_manager.dart';
import 'package:gdesign/widgets/generation/card_element.dart';

import 'package:gdesign/domain/entities/card_data.dart';
import 'package:gdesign/domain/entities/database_helper.dart';

class ConceptGenerator extends StatefulWidget {
  const ConceptGenerator({super.key});

  @override
  State<StatefulWidget> createState() => _ConceptGeneratorState();
}

class _ConceptGeneratorState extends State<ConceptGenerator> {
  
  final DatabaseHelper db = DatabaseHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadPreferences();
  }

  // Colores para cada baraja
  Map<String, Color> _deckColors = {
    'genre': Colors.blueAccent,
    'setting': Colors.greenAccent,
    'twist': Colors.orangeAccent,
    'objective': Colors.purpleAccent,
  };


  void _loadPreferences() async {
    Map<String, Color> loadedColors = {
      'genre' : await PreferencesManager.getCategoryColor('genre'),
      'setting' : await PreferencesManager.getCategoryColor('setting'),
      'twist' : await PreferencesManager.getCategoryColor('twist'),
      'objective' : await PreferencesManager.getCategoryColor('objective'),
    };

    setState(() {
      _deckColors = loadedColors;
    });
  }

  // Datos de ejemplo para las barajas
  final Map<String, List<String>> _deckData = {
    'genre': ['Plataformas', 'RPG', 'Shooter', 'Puzzle', 'Aventura'],
    'setting': ['Árbol gigante', 'Mazmorra', 'Ciudad futurista', 'Isla flotante'],
    'twist': ['Saltar en reversa', 'Enemigos son clones', 'Sin gravedad', 'Time travel'],
    'objective': ['Rescatar alien', 'Encontrar espejo', 'Escapar', 'Salvar el reino'],
  };

  // Estado actual de las cartas seleccionadas
  final Map<String, String?> _currentCards = {
    'genre': null,
    'setting': null,
    'twist': null,
    'objective': null,
  };



    // Generar una carta aleatoria para una baraja específica
  void _drawCard(String deckType) {
    final random = Random();
    final availableCards = _deckData[deckType]!;
    final randomIndex = random.nextInt(availableCards.length);

    setState(() {
      _currentCards[deckType] = availableCards[randomIndex];
    });
  }

  // Generar todas las cartas aleatoriamente
  void _generateAll() {
    _deckData.forEach((deckType, _) => _drawCard(deckType));
  }

  // Reiniciar todas las cartas
  void _resetAll() {
    setState(() {
      _currentCards.updateAll((_, __) => null);
    });
  }

  Future<void> _saveConcept() async {
    // Validar que todas las cartas estén seleccionadas
    if (_currentCards.values.any((card) => card == null)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('¡Genera todas las cartas primero!')),
      );
      return;
    }

    // Crear instancia de CardData
    final newConcept = CardData(
      id: DateTime.now().millisecondsSinceEpoch.toString(), // ID único provisional
      title: 'Concepto',
      genre: _currentCards['genre']!,
      setting: _currentCards['setting']!,
      twist: _currentCards['twist']!,
      objective: _currentCards['objective']!,
      notes: '', // Asume que tienes un TextController para notas
      date: DateTime.now(),
    );

    // Guardar en la base de datos
    try {
      final id = await db.insertConcept(newConcept);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Concepto guardado (ID: $id)')),
      );
      _resetAll(); // Opcional: Limpiar el generador
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar: $e')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Lista de cartas/barajas
          Expanded(
            child: ListView(
              children: _deckData.keys.map((deckType) {
                return DeckRow(
                  deckType: deckType,
                  currentCard: _currentCards[deckType],
                  color: _deckColors[deckType]!,
                  onDrawPressed: () => _drawCard(deckType),
                );
              }).toList(),
            ),
          ),

          // Botones de acción
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _generateAll,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Generar'),
              ),
              ElevatedButton(
                onPressed: _resetAll,
                child: const Text('Borrar'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Guardar el concepto actual
                  if (_currentCards.values.every((card) => card != null)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Concepto guardado!')),
                    );
                    _saveConcept();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Genera todas las cartas primero!')),
                    );
                  }
                },
                child: const Text('Guardar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

