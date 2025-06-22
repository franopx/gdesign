import 'package:flutter/material.dart';
import 'package:gdesign/domain/entities/card_data.dart';
import 'package:gdesign/domain/entities/database_helper.dart';

class ConceptCard extends StatefulWidget {
  final String id;
  final VoidCallback onDelete;
  final ValueChanged<String> onTitleChanged;
  final ValueChanged<String> onNotesChanged;


  const ConceptCard({
    super.key,
    required this.id,
    required this.onDelete,
    required this.onTitleChanged,
    required this.onNotesChanged,
  });

  @override
  State<StatefulWidget> createState() => _ConceptCardState();
}

class _ConceptCardState extends State<ConceptCard> {
  late String _title = 'title';
  late String _notes = 'notes';

  final TextEditingController _titleController = TextEditingController(text: 'Título');
  final TextEditingController _notesController = TextEditingController(text: 'notas');

  bool _isEditingTitle = false;
  bool _isEditingNotes = false;

  DatabaseHelper db = DatabaseHelper();
  CardData? data;
  CardData card = CardData(id: '0', title: '', genre: '', setting: '', twist: '', objective: '', notes: '', date: DateTime(2025, 6, 22));

  Future<CardData?> loadData() async {
    return db.getConcept(widget.id);
  }

  void updateData() async {
    data = await loadData();
    setState(() {
      if(data != null) {
        card = data!;
        _title = card.title;
        _notes = card.notes;
      };
    });
    
  }

  @override
  void initState() {
    super.initState();
    updateData();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _sumbitTitle(value) {
    setState(() {
      _title = value;
      _isEditingTitle = false;
    });
    widget.onTitleChanged(value);
  }

  void _sumbitNotes(value) {
    setState(() {
      _notes = value;
      _isEditingNotes = false;
    });
    widget.onNotesChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título (editable)
            Row(
              children: [
                if (_isEditingTitle)
                  Expanded(
                    child: TextField(
                      controller: _titleController,
                      onSubmitted: (value) {
                        _sumbitTitle(value);
                      },
                      decoration: InputDecoration(
                        hintText: 'Título del concepto',
                        border: InputBorder.none,
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: Text(
                      _title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                IconButton(
                  icon: Icon(_isEditingTitle ? Icons.check : Icons.edit, size: 20),
                  onPressed: () {
                    setState(() => _isEditingTitle = !_isEditingTitle);
                    if(_isEditingTitle == false) {
                      _sumbitTitle(_titleController.text);
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete, size: 20, color: Colors.red),
                  onPressed: widget.onDelete,
                ),
              ],
            ),

            // Cartas generadoras
            _buildCardInfo('Género', card.genre),
            _buildCardInfo('Mundo', card.setting),
            _buildCardInfo('Giro', card.twist),
            _buildCardInfo('Meta', card.objective),

            // Notas (editable)
            Divider(height: 20),
            Text('Notas:', style: TextStyle(fontWeight: FontWeight.bold)),
            if (_isEditingNotes)
              TextField(
                controller: _notesController,
                maxLines: 2,
                onSubmitted: (value) {
                  setState(() {
                    _notes = value;
                    _isEditingNotes = false;
                  });
                  widget.onNotesChanged(value);
                },
                decoration: InputDecoration(
                  hintText: 'Añade notas...',
                  border: InputBorder.none,
                ),
              )
            else
              InkWell(
                onTap: () => setState(() => _isEditingNotes = true),
                child: Text(
                  _notes.isEmpty ? 'Toca para añadir notas' : _notes,
                  style: TextStyle(color: _notes.isEmpty ? Colors.grey : null),
                ),
              ),
          if(_isEditingNotes) ElevatedButton(onPressed: _isEditingNotes ? () {_sumbitNotes(_notesController.text);} : null, child: const Text('Listo'))
          ],
        ),
      ),
    );
  }

  Widget _buildCardInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text('$label: ', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}