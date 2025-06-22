import 'package:flutter/material.dart';
import 'package:gdesign/domain/entities/generator.dart';
import 'package:gdesign/domain/entities/generator.dart';
import 'package:gdesign/domain/entities/prompt.dart';

import 'package:gdesign/widgets/concept_card.dart';
import 'package:gdesign/domain/entities/card_data.dart';
import 'package:gdesign/domain/entities/database_helper.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<StatefulWidget> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {

  List<Map<String, dynamic>> _concepts = [];

  bool _isLoading = true;
  final DatabaseHelper db = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _loadConcepts();
  }

  Future<void> _loadConcepts() async {
    try {
      final List<CardData> concepts = await db.getAllConcepts();
      
      setState(() {
        _concepts = concepts.map((card) => card.toMap()).toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al cargar conceptos: $e')),
      );
    }
  }

  String _sortBy = 'date';

  void _deleteConcept(int index, String conceptId) async {
    await db.deleteConcept(conceptId);
    setState(() {
      _concepts.removeAt(index);
    });
  }

  void _updateConcept(int index, String id, String newTitle, String newNotes) async {
    await db.updateConcept(id, newTitle, newNotes);
    setState(() {
      _concepts[index]['title'] = newTitle;
      _concepts[index]['notes'] = newNotes;
    });
  }


  void _updateSort() {
    setState(() {
      _concepts.sort((a, b) {
      switch (_sortBy) {
        case 'title':
          return a['title'].compareTo(b['title']);
        case 'genre':
          return a['genre'].compareTo(b['genre']);
        default:
          return b['date'].compareTo(a['date']);
      }
    });
  });
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text('Galería', style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer)), 
        backgroundColor: Theme.of(context).colorScheme.primaryContainer, foregroundColor: Theme.of(context).colorScheme.surface,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {_sortBy = value; _updateSort();},
            itemBuilder: (context) => [
              PopupMenuItem(value: 'date', child: Text('Ordenar por fecha')),
              PopupMenuItem(value: 'title', child: Text('Ordenar por título')),
              PopupMenuItem(value: 'genre', child: Text('Ordenar por género')),
            ],
            icon: Icon(Icons.sort),
          ),
        ],
        ),
      body: ListView.builder(
        itemCount: _concepts.length,
        itemBuilder: (context, index) {
          final concept = _concepts[index];
          return ConceptCard(
            key: ValueKey(concept['id']),
            id: concept['id'],
            onDelete: () => _deleteConcept(index, concept['id']),
            onTitleChanged: (newTitle) => _updateConcept(index, concept['id'], newTitle, concept['notes']),
            onNotesChanged: (newNotes) => _updateConcept(index, concept['id'], concept['title'], newNotes),
          );
        },
      ),
      );
  }
}
