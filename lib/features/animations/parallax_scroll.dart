import 'package:flutter/material.dart';
import 'dart:ui';

class ParallaxScrollAnimation extends StatefulWidget {
  final List<ParallaxItem> items;
  final double itemExtent;
  final double parallaxEffect;
  final bool enableBlur;
  final bool enableOverlay;
  final Color overlayColor;
  final Widget Function(BuildContext, int)? itemBuilder;
  final ScrollPhysics? physics;

  const ParallaxScrollAnimation({
    super.key,
    required this.items,
    this.itemExtent = 300,
    this.parallaxEffect = 0.5,
    this.enableBlur = true,
    this.enableOverlay = true,
    this.overlayColor = Colors.black26,
    this.itemBuilder,
    this.physics,
  });

  @override
  State<ParallaxScrollAnimation> createState() => _ParallaxScrollAnimationState();
}

class _ParallaxScrollAnimationState extends State<ParallaxScrollAnimation> {
  late ScrollController _scrollController;
  final GlobalKey _listKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    setState(() {}); // Trigger rebuild for animation smoothness
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        key: _listKey,
        controller: _scrollController,
        physics: widget.physics ?? const BouncingScrollPhysics(),
        itemCount: widget.items.length,
        itemExtent: widget.itemExtent,
        itemBuilder: (context, index) {
          return ParallaxItemWidget(
            item: widget.items[index],
            scrollController: _scrollController,
            itemExtent: widget.itemExtent,
            index: index,
            parallaxEffect: widget.parallaxEffect,
            enableBlur: widget.enableBlur,
            enableOverlay: widget.enableOverlay,
            overlayColor: widget.overlayColor,
            customBuilder: widget.itemBuilder,
          );
        },
      ),
    );
  }
}

class ParallaxItem {
  final String imagePath;
  final String? title;
  final String? subtitle;
  final VoidCallback? onTap;

  ParallaxItem({
    required this.imagePath,
    this.title,
    this.subtitle,
    this.onTap,
  });
}

class ParallaxItemWidget extends StatelessWidget {
  final ParallaxItem item;
  final ScrollController scrollController;
  final double itemExtent;
  final int index;
  final double parallaxEffect;
  final bool enableBlur;
  final bool enableOverlay;
  final Color overlayColor;
  final Widget Function(BuildContext, int)? customBuilder;

  const ParallaxItemWidget({
    super.key,
    required this.item,
    required this.scrollController,
    required this.itemExtent,
    required this.index,
    required this.parallaxEffect,
    required this.enableBlur,
    required this.enableOverlay,
    required this.overlayColor,
    this.customBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      child: Stack(
        children: [
          Flow(
            delegate: ParallaxFlowDelegate(
              scrollController: scrollController,
              itemExtent: itemExtent,
              index: index,
              parallaxEffect: parallaxEffect,
            ),
            children: [
              Container(
                height: itemExtent * (1 + parallaxEffect),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(item.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
                child: enableBlur
                    ? BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                  child: Container(
                    color: Colors.transparent,
                  ),
                )
                    : null,
              ),
            ],
          ),
          if (enableOverlay)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      overlayColor.withOpacity(0.1),
                      overlayColor.withOpacity(0.6),
                    ],
                  ),
                ),
              ),
            ),
          if (item.title != null || item.subtitle != null)
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (item.title != null)
                    Text(
                      item.title!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 3,
                            color: Colors.black45,
                          ),
                        ],
                      ),
                    ),
                  if (item.subtitle != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        item.subtitle!,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 3,
                              color: Colors.black45,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          if (customBuilder != null)
            Positioned.fill(
              child: customBuilder!(context, index),
            ),
        ],
      ),
    );
  }
}

class ParallaxFlowDelegate extends FlowDelegate {
  final ScrollController scrollController;
  final double itemExtent;
  final int index;
  final double parallaxEffect;

  ParallaxFlowDelegate({
    required this.scrollController,
    required this.itemExtent,
    required this.index,
    required this.parallaxEffect,
  }) : super(repaint: scrollController);

  @override
  void paintChildren(FlowPaintingContext context) {
    final scrollOffset = scrollController.position.pixels;
    final viewportDimension = scrollController.position.viewportDimension;

    final double parallaxOffset =
        (scrollOffset - (index * itemExtent)) * parallaxEffect;

    // Calculate visibility for optimization
    final double itemPosition = index * itemExtent;
    final bool isVisible = itemPosition + itemExtent > scrollOffset &&
        itemPosition < scrollOffset + viewportDimension;

    if (isVisible) {
      context.paintChild(
        0,
        transform: Matrix4.translationValues(0, parallaxOffset, 0),
      );
    }
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollController != oldDelegate.scrollController ||
        itemExtent != oldDelegate.itemExtent ||
        index != oldDelegate.index ||
        parallaxEffect != oldDelegate.parallaxEffect;
  }
}