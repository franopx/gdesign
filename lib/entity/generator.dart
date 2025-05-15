import 'dart:math';
import 'prompt.dart';


class Generator {

  Prompt currentPrompt = Prompt("Tap to generate!");

  List<String> gameGenres = [
    'A platformer game about ',
    'A first person shooter game about ',
    'A moba game about ',
    'A puzzle game about ',
    'A roguelike game about ',
    'A role playing game about ',
    'An action game about ',
    'A hack and slash game about '
  ];

  List<String> gameSubjects = [
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

  
  List<String> gameConcepts = [
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
    int genres = gameGenres.length;
    int subjects = gameSubjects.length;
    int concepts = gameConcepts.length;

    int genre = Random().nextInt(genres);
    int subject = Random().nextInt(subjects);
    int concept = Random().nextInt(concepts);

    Prompt createdPrompt = Prompt(gameGenres[genre] + gameSubjects[subject] + gameConcepts[concept]);

    currentPrompt = createdPrompt;
    return currentPrompt;
  }
}