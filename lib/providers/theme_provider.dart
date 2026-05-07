// provider is used for state management, in this case to manage theme state across the app.
// add provider: ^6.1.5+1 to package.yaml
// 1. we create ThemeProvider
// 2. In main.dart we import
//    import 'package:movie_app/providers/theme_provider.dart';
//    import 'package:provider/provider.dart';
//    we change   // runApp(const MyApp());
//    to  runApp(
//     ChangeNotifierProvider(
//       create: (_) => ThemeProvider(),
//       child: const MyApp(),
//     ),
//   );
// then in build() -> we add final themeProvider = context.watch<ThemeProvider>();
// and set themeMode: themeProvider.themeMode in MaterialApp
// 3. In home_screen.dart we import the same as main.dart and
// then in build() -> we add final themeProvider = context.watch<ThemeProvider>();
// then
// appBar: AppBar(
//   title: const Text("Movies"),
//   centerTitle: false, // left-aligned
//   actions: [
//     Padding(
//       padding: const EdgeInsets.only(right: 8.0),
//       child: SegmentedButton<ThemeMode>(
//         segments: const [
//           ButtonSegment(
//             value: ThemeMode.system,
//             icon: Icon(Icons.brightness_auto, size: 18),
//             tooltip: 'System',
//           ),
//           ButtonSegment(
//             value: ThemeMode.light,
//             icon: Icon(Icons.light_mode, size: 18),
//             tooltip: 'Light',
//           ),
//           ButtonSegment(
//             value: ThemeMode.dark,
//             icon: Icon(Icons.dark_mode, size: 18),
//             tooltip: 'Dark',
//           ),
//         ],
//         selected: {themeProvider.themeMode},
//         onSelectionChanged: (Set<ThemeMode> selection) {
//           themeProvider.setTheme(selection.first);
//         },
//         showSelectedIcon: false,
//         style: ButtonStyle(
//           tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//           visualDensity: VisualDensity.compact,
//         ),
//       ),
//     ),
//   ],
// ),
//
// Q. NOW ASK THEM TO CREATE AN SETTINGS ICON ON RIGHT WHICH WILL OPEN THE SETTINGS SCREEN THEIR ADD THIS.
// Q. STORE THE THEME MODE SELECTED BY USER IN SHARED PREFERENCES AND LOAD IT WHEN THE APP STARTS.

import 'package:flutter/material.dart';

// changeNotifier listens to changes in the widget and rebuilds the widget tree when there is a change.
// In this case, when the theme mode is updated, it will notify all listeners (widgets that are using this provider) to rebuild with the new theme mode.
class ThemeProvider extends ChangeNotifier {
  // private field for theme mode
  ThemeMode _themeMode = ThemeMode.system; // default is system

  // getter for theme mode
  ThemeMode get themeMode {
    return _themeMode;
  }

  // method to update theme mode
  void setTheme(ThemeMode mode) {
    _themeMode = mode;
    // notifyListeners() will notify all the listeners that are listening to this provider to rebuild with the new theme mode.
    notifyListeners();
  }
}
