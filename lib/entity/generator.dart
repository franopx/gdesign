import 'dart:math';
import 'prompt.dart';


class Generator {

  Prompt currentPrompt = Prompt("Tap to generate!");
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

  Prompt generateConcept() {
    int genres = _gameGenres.length;
    int subjects = _gameSubjects.length;
    int concepts = _gameConcepts.length;

    int genre = Random().nextInt(genres);
    int subject = Random().nextInt(subjects);
    int concept = Random().nextInt(concepts);

    Prompt createdPrompt = Prompt(_gameGenres[genre] + _gameSubjects[subject] + _gameConcepts[concept]);

    promptHistory.add(createdPrompt);
    currentPrompt = createdPrompt;
    return currentPrompt;
  }
}