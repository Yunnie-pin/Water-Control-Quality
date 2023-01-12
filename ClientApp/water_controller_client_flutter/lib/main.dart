import 'package:flutter/material.dart';
import 'package:water_controller_client_flutter/view/add_page.dart';
import 'package:water_controller_client_flutter/view/home_page.dart';
import 'package:water_controller_client_flutter/view/saved_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme =
        ThemeData(scaffoldBackgroundColor: const Color(0xFFfef1ea));
    return MaterialApp(
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: const Color(0xFF24363a),
          secondary: const Color(0xFFf11d5f),
        ),
      ),
      title: 'WaterController',
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeViews(),
        '/favorite': (context) => const SavedPages(),
        '/add': (context) => const AddDataPages(),
      },
    );
  }
}
