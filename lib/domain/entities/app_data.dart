
import 'package:flutter/material.dart';
import 'package:gdesign/domain/entities/preferences_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppData extends ChangeNotifier {


  String _username = 'user';
  String get username => _username;

  bool _dark_mode = true;
  bool get dark_mode => _dark_mode;

  Map<String, Color> _categoryColors = {
    'genre': Colors.blue,
    'setting': Colors.green,
    'twist': Colors.orange,
    'objective': Colors.purple,
  };

  Future<void> _loadPreferences() async {
    _username = await PreferencesManager.getUsername();
    _dark_mode = await PreferencesManager.getDarkMode();
    _categoryColors = {
      'genre' : await PreferencesManager.getCategoryColor('genre'),
      'setting' : await PreferencesManager.getCategoryColor('setting'),
      'twist' : await PreferencesManager.getCategoryColor('twist'),
      'objective' : await PreferencesManager.getCategoryColor('objective'),
    };
    notifyListeners();
  }

  void setUsername(String value) {
    _username = value;
    notifyListeners();
  }

  void setDarkMode(bool value) {
    _dark_mode = value;
    notifyListeners();
  }

}