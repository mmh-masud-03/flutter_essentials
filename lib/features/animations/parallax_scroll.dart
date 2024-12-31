import 'package:flutter/material.dart';

class ParallaxScrollAnimation extends StatefulWidget {
  final List<String> imagePaths;
  final double itemExtent;

  const ParallaxScrollAnimation({
    Key? key,
    required this.imagePaths,
    this.itemExtent = 300,
  }) : super(key: key);

  @override
  State<ParallaxScrollAnimation> createState() => _ParallaxScrollAnimationState();
}

class _ParallaxScrollAnimationState extends State<ParallaxScrollAnimation> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.imagePaths.length,
      itemExtent: widget.itemExtent,
      itemBuilder: (context, index) {
        return ParallaxItem(
          imagePath: widget.imagePaths[index],
          scrollController: _scrollController,
          itemExtent: widget.itemExtent,
          index: index,
        );
      },
    );
  }
}

class ParallaxItem extends StatelessWidget {
  final String imagePath;
  final ScrollController scrollController;
  final double itemExtent;
  final int index;

  const ParallaxItem({
    Key? key,
    required this.imagePath,
    required this.scrollController,
    required this.itemExtent,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: ParallaxFlowDelegate(
        scrollController: scrollController,
        itemExtent: itemExtent,
        index: index,
      ),
      children: [
        Image.network(
          imagePath,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}

class ParallaxFlowDelegate extends FlowDelegate {
  final ScrollController scrollController;
  final double itemExtent;
  final int index;

  ParallaxFlowDelegate({
    required this.scrollController,
    required this.itemExtent,
    required this.index,
  }) : super(repaint: scrollController);

  @override
  void paintChildren(FlowPaintingContext context) {
    final scrollOffset = scrollController.position.pixels;
    final double parallaxOffset =
        (scrollOffset - (index * itemExtent)) / 2.0;

    context.paintChild(
      0,
      transform: Matrix4.translationValues(0, parallaxOffset, 0),
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollController != oldDelegate.scrollController ||
        itemExtent != oldDelegate.itemExtent ||
        index != oldDelegate.index;
  }
}