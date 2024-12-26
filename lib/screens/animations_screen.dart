import 'package:flutter/material.dart';
import 'package:flutter_essentials/features/animations/animated_container.dart';
import 'package:flutter_essentials/features/animations/fade_transition.dart';
import 'package:flutter_essentials/features/animations/hero_animation.dart';
import 'package:flutter_essentials/features/animations/rotation.dart';
import 'package:flutter_essentials/features/animations/scale_transition.dart';
import 'package:flutter_essentials/features/animations/slide_transition.dart';
import 'package:flutter_essentials/widgets/expendable_section.dart';

class UIAnimationsScreen extends StatelessWidget {
  const UIAnimationsScreen({super.key});

  List<Widget> _buildAnimationSections(BuildContext context) {
    return [
      _buildFadeTransitionSection(context),
      const SizedBox(height: 20),
      _buildScaleTransitionSection(context),
      const SizedBox(height: 20),
      _buildSlideTransitionSection(context),
      const SizedBox(height: 20),
      _buildRotationTransitionSection(context),
      const SizedBox(height: 20),
      _buildHeroAnimationSection(context),
      const SizedBox(height: 20),
      _buildAnimatedContainerSection(context),
    ];
  }

  Widget _buildFadeTransitionSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Fade Transition',
      widget: const FadeTransitionExample(),
      description: 'Animates the opacity of a widget.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/blob/master/lib/features/animations/fade_transition_example.dart',
    );
  }

  Widget _buildScaleTransitionSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Scale Transition',
      widget: const ScaleTransitionExample(),
      description: 'Animates the scaling of a widget.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/blob/master/lib/features/animations/scale_transition_example.dart',
    );
  }

  Widget _buildSlideTransitionSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Slide Transition',
      widget: const SlideTransitionExample(),
      description: 'Animates the position of a widget.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/blob/master/lib/features/animations/slide_transition_example.dart',
    );
  }

  Widget _buildRotationTransitionSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Rotation Transition',
      widget: const RotationTransitionExample(),
      description: 'Animates the rotation of a widget.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/blob/master/lib/features/animations/rotation_transition_example.dart',
    );
  }

  Widget _buildHeroAnimationSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Hero Animation',
      widget: const HeroAnimationExample(),
      description: 'Creates a smooth transition between two screens.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/blob/master/lib/features/animations/hero_animation_example.dart',
    );
  }

  Widget _buildAnimatedContainerSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Animated Container',
      widget: const AnimatedContainerExample(),
      description: 'Animates changes in container properties like size, color, and more.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/blob/master/lib/features/animations/animated_container_example.dart',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: _buildAnimationSections(context),
        ),
      ),
    );
  }
}
