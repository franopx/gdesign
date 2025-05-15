
class Prompt {
  String promptText;
  int id = -1;

  void editPrompt(String newText) {promptText = newText;}
  String getPromptText() {return promptText;}

  Prompt(this.promptText);
}