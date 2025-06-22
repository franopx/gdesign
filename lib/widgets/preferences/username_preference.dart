import 'package:flutter/material.dart';
import 'package:gdesign/widgets/preferences/preference_tile.dart';

class UsernamePreference extends StatefulWidget {
  final String initialValue;
  final ValueChanged<String> onChanged;

  const UsernamePreference({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  _UsernamePreferenceState createState() => _UsernamePreferenceState();
}

class _UsernamePreferenceState extends State<UsernamePreference> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    return PreferenceTile(
      title: 'Usuario: ${widget.initialValue}',
      trailing: Icon(Icons.edit),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Cambiar nombre'),
            content: TextField(
              controller: _controller,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  widget.onChanged(_controller.text); // Guarda en SharedPreferences
                  Navigator.pop(context);
                },
                child: Text('Guardar'),
              ),
            ],
          ),
        );
      },
    );
  }
}