import 'package:flutter/material.dart';
import 'package:sunnah_diet/views/widget_tree.dart';
import 'config/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: SunnahDietTheme.lightTheme,
      home: const WidgetTree(),
    );
  }
}
