import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel_slider;

class CarouselScreen extends StatelessWidget {
  const CarouselScreen({super.key});

  List<String> _getImageList() {
    return [
      'https://picsum.photos/800/400?img=1',
      'https://picsum.photos/800/400?img=2',
      'https://picsum.photos/800/400?img=3',
      'https://picsum.photos/800/400?img=4',
      'https://picsum.photos/800/400?img=5',
    ];
  }

  Widget _buildCarouselItem(String item, int index) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        child: Stack(
          children: <Widget>[
            Image.network(item, fit: BoxFit.fill, width: 1000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text(
                  'Image ${index + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = _getImageList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carousel Example'),
        centerTitle: true,
      ),
      body: Center(
        child: carousel_slider.CarouselSlider(
          options: carousel_slider.CarouselOptions(
            height: 400.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            viewportFraction: 0.8,
          ),
          items: imgList.asMap().entries.map((entry) {
            return _buildCarouselItem(entry.value, entry.key);
          }).toList(),
        ),
      ),
    );
  }
}