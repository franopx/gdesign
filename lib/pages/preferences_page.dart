import 'package:flutter/material.dart';
import 'package:gdesign/domain/entities/app_data.dart';
import 'package:gdesign/domain/entities/preferences_manager.dart';
import 'package:gdesign/widgets/preferences/username_preference.dart';
import 'package:gdesign/widgets/preferences/theme_preference.dart';
import 'package:gdesign/widgets/preferences/color_preference.dart';
import 'package:provider/provider.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});
  
  @override
  State<StatefulWidget> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  String _username = 'Usuario';
  bool _isDarkMode = false;
  Map<String, Color> _categoryColors = {
    'genre': Colors.blue,
    'setting': Colors.green,
    'twist': Colors.orange,
    'objective': Colors.purple,
  };

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    String loadedUsername = await PreferencesManager.getUsername();
    bool loadedDarkMode = await PreferencesManager.getDarkMode();
    Map<String, Color> loadedColors = {
      'genre' : await PreferencesManager.getCategoryColor('genre'),
      'setting' : await PreferencesManager.getCategoryColor('setting'),
      'twist' : await PreferencesManager.getCategoryColor('twist'),
      'objective' : await PreferencesManager.getCategoryColor('objective'),
    };


    setState(() {
      _username = loadedUsername;
      _isDarkMode = loadedDarkMode;
      _categoryColors = loadedColors;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    
    var appdata = context.watch<AppData>();

    return Scaffold(
      appBar: AppBar(
        title: Text('GDesign', style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer)), 
        backgroundColor: Theme.of(context).colorScheme.primaryContainer, foregroundColor: Theme.of(context).colorScheme.surface,),
      body: ListView(
        children: [
          UsernamePreference(
            initialValue: _username,
            onChanged: (newName) async {
              await PreferencesManager.setUsername(newName);
              setState(() => _username = newName);
            },
          ),
          ThemePreference(
            isDarkMode: _isDarkMode,
            onChanged: (value) async {
              await PreferencesManager.setDarkMode(value);
              setState(() => _isDarkMode = value);
              appdata.setDarkMode(value);
            },
          ),
          ..._categoryColors.entries.map((entry) => ColorPreference(
                category: entry.key,
                currentColor: entry.value,
                onColorChanged: (color) async {
                  await PreferencesManager.setCategoryColor(entry.key, color.value);
                  setState(() => _categoryColors[entry.key] = color);
                },
              )),
        ],
      ),
    );
  }
}