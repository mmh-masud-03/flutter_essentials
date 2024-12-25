import 'package:flutter/material.dart';

class CustomRatingBar extends StatefulWidget {
  final int maxStars;
  final double initialRating;
  final ValueChanged<double> onRatingChanged;

  const CustomRatingBar({
    Key? key,
    required this.maxStars,
    required this.initialRating,
    required this.onRatingChanged,
  }) : super(key: key);

  @override
  _CustomRatingBarState createState() => _CustomRatingBarState();
}

class _CustomRatingBarState extends State<CustomRatingBar> {
  double rating = 0;

  @override
  void initState() {
    super.initState();
    rating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(widget.maxStars, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              rating = index + 1.0;
            });
            widget.onRatingChanged(rating);
          },
          child: Icon(
            Icons.star,
            color: index < rating ? Colors.amber : Colors.grey,
          ),
        );
      }),
    );
  }
}
