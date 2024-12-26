import 'package:flutter/material.dart';
import 'package:flutter_essentials/screens/animations_screen.dart';
import 'package:flutter_essentials/screens/home_screen.dart';
import 'package:flutter_essentials/screens/ui_widgets_screen.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Helper',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routes: {
        "/ui-widgets":(context)=>UIWidgetsScreen(),
        "animations-screen":(context)=>AnimationsScreen()
      },
      home: const HomeScreen(),
    );
  }
}
