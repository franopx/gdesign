import 'package:flutter/material.dart';
import 'package:gdesign/widgets/concept_card.dart';
import 'package:gdesign/domain/entities/card_data.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();
  
  Future<void> initializeDatabase() async {
    await database;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'card_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }


  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE savedCards (
    id TEXT PRIMARY KEY,
    title TEXT NOT NULL,
    genre TEXT NOT NULL,
    setting TEXT NOT NULL,
    twist TEXT NOT NULL,
    objective TEXT NOT NULL,
    notes TEXT NOT NULL,
    date TEXT NOT NULL
    )
    ''');
  }


  Future<int> insertConcept(CardData data) async {
  final db = await database;
  return await db.insert(
    'savedCards',
    data.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> deleteConcept(String conceptId) async {
    final db = await database;
    return await db.delete(
      'savedCards',       // Nombre de la tabla
      where: 'id = ?', // Condición WHERE
      whereArgs: [conceptId], // Valor para el placeholder
    );
  }

  Future<List<CardData>> getAllConcepts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('savedCards');

    // Convierte cada Map a un objeto CardData
    return List.generate(maps.length, (i) {
      return CardData(
        id: maps[i]['id'].toString(),
        title: maps[i]['title'],
        genre: maps[i]['genre'],
        setting: maps[i]['setting'],
        twist: maps[i]['twist'],
        objective: maps[i]['objective'],
        notes: maps[i]['notes'] ?? '', // Si es nullable
        date: DateTime.parse(maps[i]['date']), // String -> DateTime
      );
    });
  }

  Future<CardData?> getConcept(String id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'savedCards',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );

    if(maps.isNotEmpty) {
      return CardData(
        id: maps[0]['id'].toString(),
        title: maps[0]['title'],
        genre: maps[0]['genre'],
        setting: maps[0]['setting'],
        twist: maps[0]['twist'],
        objective: maps[0]['objective'],
        notes: maps[0]['notes'] ?? '', // Si es nullable
        date: DateTime.parse(maps[0]['date']), // String -> DateTime
      );
    }
    return null;
  }

  Future<int> updateConcept(String id, String newTitle, String newNotes) async {
    CardData? card = await getConcept(id);

    if(card != null) {
      final db = await database;

      CardData newCard = CardData(
        id: id, 
        title: newTitle, 
        genre: card.genre, 
        setting: card.setting, 
        twist: card.twist, 
        objective: card.objective, 
        notes: newNotes, 
        date: card.date
      );
      
      return await db.update(
        'savedCards',
        newCard.toMap(),
        where: 'id = ?',
        whereArgs: [card.id]
        );
    }
    return -1;
  }
}
