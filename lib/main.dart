import 'package:flutter/material.dart';
import 'package:flutter_essentials/features/animations/confetti_animation.dart';
import 'package:flutter_essentials/features/animations/spring.dart';
import 'package:flutter_essentials/features/boilerplates/drawer.dart';
import 'package:flutter_essentials/features/examples/bottom_bar.dart';
import 'package:flutter_essentials/features/examples/form.dart';
import 'package:flutter_essentials/screens/animations_screen.dart';
import 'package:flutter_essentials/screens/api_integration_screen.dart';
import 'package:flutter_essentials/screens/boilerplates_screen.dart';
import 'package:flutter_essentials/screens/examples_screen.dart';
import 'package:flutter_essentials/screens/home_screen.dart';
import 'package:flutter_essentials/screens/internationalization.dart';
import 'package:flutter_essentials/screens/ui_widgets_screen.dart';
import 'core/theme/app_theme.dart';
import 'features/animations/parallax_scroll.dart';
import 'features/examples/carousel.dart';
import 'features/examples/charts.dart';
import 'features/examples/drag_and_drop.dart';
import 'features/examples/grid.dart';
import 'features/examples/list.dart';
import 'features/examples/silvers.dart';
import 'features/examples/tabs.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Define route names as static constants for type safety and reusability
  static const String uiWidgetsRoute = '/ui-widgets';
  static const String animationsRoute = '/animations-screen';
  static const String boilerplateRoute = '/boilerplate';
  static const String apiIntegrationRoute = '/api-integration';
  static const String drawerRoute = '/drawer';
  static const String examplesRoute = '/examples';
  static const String formRoute = '/form-screen';
  static const String gridRoute = '/grid-screen';
  static const String listRoute = '/list-screen';
  static const String carouselRoute = '/carousel-screen';
  static const String tabsRoute = '/tabs-screen';
  static const String sliversRoute = '/slivers-screen';
  static const String chartsRoute = '/charts-screen';
  static const String dragAndDropRoute = '/drag-and-drop-screen';
  static const String bottomBarRoute = '/bottom-bar';
  static const String confettiRoute = '/confetti';
  static const String parallaxScrollRoute = '/parallax-scroll';
  static const String springRoute = '/spring';
  static const String internationalizationRoute = '/internationalization';

  // Sample parallax items
  static final List<ParallaxItem> parallaxItems = [
    ParallaxItem(
      imagePath: 'https://picsum.photos/800/400?img=1',
      title: 'Mountain Vista',
      subtitle: 'Explore the majestic peaks',
      onTap: () => debugPrint('Tapped Mountain Vista'),
    ),
    ParallaxItem(
      imagePath: 'https://picsum.photos/800/400?img=2',
      title: 'Ocean Waves',
      subtitle: 'Feel the sea breeze',
      onTap: () => debugPrint('Tapped Ocean Waves'),
    ),
    ParallaxItem(
      imagePath: 'https://picsum.photos/800/400?img=3',
      title: 'Desert Sands',
      subtitle: 'Experience the vast wilderness',
      onTap: () => debugPrint('Tapped Desert Sands'),
    ),
    ParallaxItem(
      imagePath: 'https://picsum.photos/800/400?img=4',
      title: 'City Lights',
      subtitle: 'Discover the urban jungle',
      onTap: () => debugPrint('Tapped City Lights'),
    ),
    ParallaxItem(
      imagePath: 'https://picsum.photos/800/400?img=5',
      title: 'Forest Canopy',
      subtitle: 'Get lost in the woods',
      onTap: () => debugPrint('Tapped Forest Canopy'),
    ),
    ParallaxItem(imagePath: 'https://picsum.photos/800/400?img=6',
      title: 'Sunset Horizon',
      subtitle: 'Chase the setting sun',
      onTap: () => debugPrint('Tapped Sunset Horizon'),
    ),
    ParallaxItem(imagePath: 'https://picsum.photos/800/400?img=7',
      title: 'River Rapids',
      subtitle: 'Ride the white waters',
      onTap: () => debugPrint('Tapped River Rapids'),
    ),
    ParallaxItem(imagePath: 'https://picsum.photos/800/400?img=8',
      title: 'Snowy Slopes',
      subtitle: 'Ski the snowy slopes',
      onTap: () => debugPrint('Tapped Snowy Slopes'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Helper',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routes: {
        uiWidgetsRoute: (context) => const UIWidgetsScreen(),
        animationsRoute: (context) => const UIAnimationsScreen(),
        boilerplateRoute: (context) => const BoilerplatesScreen(),
        apiIntegrationRoute: (context) => const ApiMethodsScreen(),
        drawerRoute: (context) => const DrawerScreen(),
        examplesRoute: (context) => const ExamplesScreen(),
        formRoute: (context) => const FormExample(),
        gridRoute: (context) => const GridScreen(),
        listRoute: (context) => const ListScreen(),
        carouselRoute: (context) => const CarouselScreen(),
        tabsRoute: (context) => const TabsScreen(),
        sliversRoute: (context) => const SliversScreen(),
        chartsRoute: (context) => const ChartsScreen(),
        dragAndDropRoute: (context) => const DragAndDropScreen(),
        bottomBarRoute: (context) => const BottomBarScreen(),
        confettiRoute: (context) => const ConfettiAnimation(),
        springRoute: (context) =>const FullscreenSpringDemo(),
        internationalizationRoute: (context) => const InternationalizationScreen(),
        parallaxScrollRoute: (context) => ParallaxScrollAnimation(
          items: parallaxItems,
          itemExtent: 300,
          parallaxEffect: 0.5,
          enableBlur: true,
          enableOverlay: true,
        ),
      },
      home: const HomeScreen(),
    );
  }
}