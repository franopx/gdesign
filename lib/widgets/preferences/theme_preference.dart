import 'package:flutter/material.dart';
import 'package:gdesign/widgets/preferences/preference_tile.dart';

class ThemePreference extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onChanged;

  const ThemePreference({
    super.key,
    required this.isDarkMode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PreferenceTile(
      title: 'Tema de la app',
      subtitle: isDarkMode ? 'Oscuro' : 'Claro',
      trailing: Switch(
        value: isDarkMode,
        onChanged: onChanged,
      ),
    );
  }
}