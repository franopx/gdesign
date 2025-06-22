import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {

  // Guardar preferencias
  static Future<void> setUsername(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', value);
  }

  static Future<void> setDarkMode(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('dark_mode', value);
  }

  static Future<void> setCategoryColor(String category, int colorValue) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('color_$category', colorValue);
  }

  // Leer preferencias
  static Future<String> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('username') ?? 'user';
  }

  static Future<bool> getDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('dark_mode')?? true;
  }

  static Future<Color> getCategoryColor(String category) async {
    final prefs = await SharedPreferences.getInstance();
    return Color(prefs.getInt('color_$category') ?? _defaultColor(category));
  }

  // Colores por defecto
  static int _defaultColor(String category) {
    switch (category) {
      case 'genre': return Colors.blue.toARGB32();
      case 'setting': return Colors.green.toARGB32();
      case 'twist': return Colors.orange.toARGB32();
      case 'objective': return Colors.purple.toARGB32();
      default: return Colors.grey.toARGB32();
    }
  }
}