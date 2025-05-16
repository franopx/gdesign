import 'dart:math';
import 'prompt.dart';
import 'package:flutter/material.dart';

class Generator {

  Prompt currentPrompt = Prompt("Tap to generate!", Image.asset('assets/images/game/idea.png'));
  List<Prompt> promptHistory = [];

  final List<String> _gameGenres = [
    'A platformer game about ',
    'A first person shooter game about ',
    'A moba game about ',
    'A puzzle game about ',
    'A roguelike game about ',
    'A role playing game about ',
    'An action game about ',
    'A hack and slash game about '
  ];

  final List<String> _gameSubjects = [
    'a group of heroes ',
    'a young hero ',
    'a magic creature ',
    'abstract shapes ',
    'cards ',
    'racing cars ',
    'toys ',
    'adventurers ',
    'a robot ',
    'pirates ',
    'ninjas '
  ];
  
  final List<String> _gameConcepts = [
    'trying to save the world.',
    'competing in a tournament.',
    'destroying an evil empire.',
    'discovering an unknown world.',
    'on a introspective journey.',
    'traveling across the universe.',
    'searching for a disappeared friend.',
    'playing a sport.',
    'collecting sacred artifacts.',
    'uncovering an ancient prophecy.'
  ];

  final List<Image> _gameIcons = [
    Image.asset('assets/images/game/difficulties.png', width: 64, height: 64,),
    Image.asset('assets/images/game/idea.png', width: 64, height: 64,),
    Image.asset('assets/images/game/pistol.png', width: 64, height: 64,),
    Image.asset('assets/images/game/puzzle-piece.png', width: 64, height: 64,),
    Image.asset('assets/images/game/sword.png', width: 64, height: 64,),
    Image.asset('assets/images/game/target.png', width: 64, height: 64,)
  ];

  Prompt generateConcept() {
    int genres = _gameGenres.length;
    int subjects = _gameSubjects.length;
    int concepts = _gameConcepts.length;
    int icons = _gameIcons.length;

    int genre = Random().nextInt(genres);
    int subject = Random().nextInt(subjects);
    int concept = Random().nextInt(concepts);
    int icon = Random().nextInt(icons);

    Prompt createdPrompt = Prompt(_gameGenres[genre] + _gameSubjects[subject] + _gameConcepts[concept], _gameIcons[icon]);

    promptHistory.add(createdPrompt);
    currentPrompt = createdPrompt;
    return currentPrompt;
  }
}