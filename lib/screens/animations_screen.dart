import 'package:flutter/material.dart';
import 'package:flutter_essentials/features/animations/animated_container.dart';
import 'package:flutter_essentials/features/animations/fade_transition.dart';
import 'package:flutter_essentials/features/animations/hero_animation.dart';
import 'package:flutter_essentials/features/animations/rotation.dart';
import 'package:flutter_essentials/features/animations/scale_transition.dart';
import 'package:flutter_essentials/features/animations/shimmer_loading.dart';
import 'package:flutter_essentials/features/animations/slide_transition.dart';
import 'package:flutter_essentials/features/animations/typing.dart';
import 'package:flutter_essentials/widgets/expendable_section.dart';
import '../features/animations/flip_card.dart';
import '../features/animations/particle.dart';
import '../features/animations/pulse.dart';

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
      const SizedBox(height: 20),
      _buildShimmerSection(context),
      const SizedBox(height: 20),
      _buildPulseSection(context),
      const SizedBox(height: 20),
      _buildFlipCardSection(context),
      const SizedBox(height: 20),
      _buildTypingTextSection(context),
      const SizedBox(height: 20),
      _buildParticleSection(context),
    ];
  }

  Widget _buildFadeTransitionSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Fade Transition',
      widget: const FadeTransitionExample(),
      description: 'Animates the opacity of a widget.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/animations/fade_transition.dart'
    );
  }

  Widget _buildScaleTransitionSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Scale Transition',
      widget: const ScaleTransitionExample(),
      description: 'Animates the scaling of a widget.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/animations/scale_transition.dart'
    );
  }

  Widget _buildSlideTransitionSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Slide Transition',
      widget: const SlideTransitionExample(),
      description: 'Animates the position of a widget.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/animations/slide_transition.dart'
    );
  }

  Widget _buildRotationTransitionSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Rotation Transition',
      widget: const RotationTransitionExample(),
      description: 'Animates the rotation of a widget.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/animations/rotation.dart'
    );
  }

  Widget _buildHeroAnimationSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Hero Animation',
      widget: const HeroAnimationExample(),
      description: 'Creates a smooth transition between two screens.',
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/animations/hero_animation.dart"
    );
  }

  Widget _buildAnimatedContainerSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Animated Container',
      widget: const AnimatedContainerExample(),
      description: 'Animates changes in container properties like size, color, and more.',
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/animations/animated_container.dart"
    );
  }

  Widget _buildShimmerSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Shimmer Loading',
      widget: const ShimmerLoadingAnimation(width: 200, height: 200),
      description: 'Creates a shimmering effect to indicate loading.',
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/animations/shimmer_loading.dart"
    );
  }

  Widget _buildPulseSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Pulse Animation',
      widget: const PulseAnimation(child: Icon(Icons.favorite, size: 100, color: Colors.red)
        ,),
      description: 'Creates a pulsing effect on a widget.',
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/animations/pulse.dart"
    );
  }

  Widget _buildFlipCardSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Flip Card',
      widget: FlipCard(front:
        Card(
          child: Container(
            height: 200,
            width: 200,

            child: Text('Front'),
          ),
        ),
         back:
        Card(
          child: Container(
            height: 200,
            width: 200,

            child: Text('Back'),
          ),
        )

        ,),
      description: 'Creates a card that flips to reveal another card.',
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/animations/flip_card.dart"
    );
  }

  Widget _buildTypingTextSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Typing Text',
      widget: const TypingTextAnimation(text: 'Hello, World!', duration: Duration(seconds: 2)),
      description: 'Simulates typing text on the screen.',
      codeUrl: ""
    );
  }

  Widget _buildParticleSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Particle Animation',
      widget: const ParticleAnimation(),
      description: 'Creates a particle effect on the screen.',
      codeUrl: ""
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
