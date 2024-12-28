import 'package:flutter/material.dart';
import 'package:flutter_essentials/features/boilerplates/drawer.dart';
import 'package:flutter_essentials/features/examples/form.dart';
import 'package:flutter_essentials/screens/animations_screen.dart';
import 'package:flutter_essentials/screens/api_integration_screen.dart';
import 'package:flutter_essentials/screens/boilerplates_screen.dart';
import 'package:flutter_essentials/screens/examples_screen.dart';
import 'package:flutter_essentials/screens/home_screen.dart';
import 'package:flutter_essentials/screens/ui_widgets_screen.dart';
import 'core/theme/app_theme.dart';
import 'features/examples/carousel.dart';
import 'features/examples/grid.dart';
import 'features/examples/list.dart';

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
        "/animations-screen":(context)=>UIAnimationsScreen(),
        "/boilerplate":(context)=>BoilerplatesScreen(),
        "/api-integration":(context)=>ApiMethodsScreen(),
        "/drawer":(context)=>DrawerScreen(),
        "/examples":(context)=>ExamplesScreen(),
        "/form-screen":(context)=>FormExample(),
        "/grid-screen":(context)=>GridScreen(),
        "/list-screen":(context)=>ListScreen(),
        "/carousel-screen":(context)=>CarouselScreen(),
      },
      home: const HomeScreen(),
    );
  }
}
