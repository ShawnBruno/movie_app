import 'package:flutter/material.dart';
import 'package:movie_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      
        child: SegmentedButton<ThemeMode>(
          segments: const [
            ButtonSegment(
              value: ThemeMode.system,
              
              icon: Icon(Icons.brightness_auto),
            ),
            ButtonSegment(
              value: ThemeMode.light,
              
              icon: Icon(Icons.light_mode),
            ),
            ButtonSegment(
              value: ThemeMode.dark,
              
              icon: Icon(Icons.dark_mode),
            ),
          ],
          selected: {themeProvider.themeMode},
          onSelectionChanged: (selection) {
            themeProvider.setTheme(selection.first);
            Navigator.pop(context); // closes popup
          },
          showSelectedIcon: false,
        ),
      
    );
  }
}