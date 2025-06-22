
class CardData {
  
  final String id;
  final String title;
  final String genre;
  final String setting;
  final String twist;
  final String objective;
  final String notes;
  final DateTime date;

  CardData({
    required this.id, 
    required this.title, 
    required this.genre, 
    required this.setting,
    required this.twist, 
    required this.objective,
    required this.notes,
    required this.date
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'title': title,
      'Género': genre,
      'Setting': setting,
      'Giro': twist,
      'Meta': objective,
      'notes': notes,
      'date': date.toString(),
    };
  }

}