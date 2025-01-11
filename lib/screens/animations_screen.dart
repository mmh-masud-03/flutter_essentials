import 'package:flutter/material.dart';
import 'package:flutter_essentials/features/animations/animated_container.dart';
import 'package:flutter_essentials/features/animations/fade_transition.dart';
import 'package:flutter_essentials/features/animations/hero_animation.dart';
import 'package:flutter_essentials/features/animations/liquid_wave.dart';
import 'package:flutter_essentials/features/animations/morphing_shape.dart';
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
      _buildHeader(context),
      const SizedBox(height: 24),
      ..._buildCategorizedAnimations(context),
    ];
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Animation Gallery',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Explore various animation techniques in Flutter',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
  List<Widget> _buildCategorizedAnimations(BuildContext context) {
    final categories = {
      'Basic Transitions': [
        _buildFadeTransitionSection(context),
        _buildScaleTransitionSection(context),
        _buildSlideTransitionSection(context),
        _buildRotationTransitionSection(context),
      ],
      'Container Animations': [
        _buildAnimatedContainerSection(context),
        _buildFlipCardSection(context),
        _buildMorphingSection(context),
      ],
      'Loading & Effects': [
        _buildShimmerSection(context),
        _buildPulseSection(context),
        _buildParticleSection(context),
        _buildLiquidWaveSection(context),
      ],
      'Interactive Animations': [
        _buildHeroAnimationSection(context),
        _buildTypingTextSection(context),
        _buildConfettiSection(context),
        _buildParallaxScrollSection(context),
        _buildSpringSection(context),
      ],
    };

    return categories.entries.expand((category) {
      return [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            category.key,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        ...category.value.map((widget) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: widget,
        )),
        const SizedBox(height: 24),
      ];
    }).toList();
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
          child: SizedBox(
            height: 200,
            width: 200,

            child: Text('Front'),
          ),
        ),
         back:
        Card(
          child: SizedBox(
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
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/animations/typing.dart"
    );
  }

  Widget _buildParticleSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Particle Animation',
      widget: const ParticleAnimation(),
      description: 'Creates a particle effect on the screen.',
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/animations/particle.dart"
    );
  }

  Widget _buildConfettiSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Confetti Animation',
      widget: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.blue,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/confetti');
        },
        child: const Text('Open Confetti Animation'),
      ),
      description: 'Creates a confetti effect on the screen.',
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/animations/confetti_animation.dart"
    );
  }

  Widget _buildParallaxScrollSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Parallax Scroll',
      widget: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.blue,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/parallax-scroll');
        },
        child: const Text('Open Parallax Scroll'),
      ),
      description: 'Creates a parallax effect on the screen.',
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/animations/parallax_scroll.dart"
    );
  }

  Widget _buildLiquidWaveSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Liquid Wave',
      widget: const LiquidWaveAnimation(),
      description: 'Creates a liquid wave effect on the screen.',
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/animations/liquid_wave.dart"
    );
  }

  Widget _buildMorphingSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Morphing',
      widget: const MorphingShapeAnimation(),
      description: 'Creates a morphing effect on the screen.',
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/animations/morphing_shape.dart"
    );
  }

  Widget _buildSpringSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Spring',
      widget: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.blue,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/spring');
        },
        child: const Text('Open Spring Animation'),
      ),
      description: 'Creates a spring effect on the screen.',
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/animations/spring.dart"
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Animations',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey[50],
        child: ListView(
          children: _buildAnimationSections(context),
        ),
      ),
    );
  }

}
