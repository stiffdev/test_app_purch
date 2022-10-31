import 'package:flutter/material.dart';

typedef void RatingChangeCallback(double rating);

class StarWidget extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;

  StarWidget(
      {this.starCount = 4, this.rating = .0, required this.onRatingChanged});

  Widget buildStar(BuildContext context, int index) {
    Container image;

    image = Container(
      padding: EdgeInsets.all(5),
      child: Image.asset(
        'assets/images/${index + 1}.png',
        width: MediaQuery.of(context).size.width / 7,
      ),
    );

    /*  if (index == 0) {
     
      icon = Icon(
        Icons.star_border,
        size: MediaQuery.of(context).size.width / 10,
        color: Colors.pink,
      );
    } else if (index == 1) {
      icon = Icon(
        Icons.star_half,
        color: Theme.of(context).primaryColor,
      );
    } else if (index == 2) {
      icon = Icon(
        Icons.star,
        size: MediaQuery.of(context).size.width / 10,
        color: Theme.of(context).primaryColor,
      );
    }else if (index == 1) {

    }*/
    return new InkResponse(
      onTap:
          onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: image,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            new List.generate(starCount, (index) => buildStar(context, index)));
  }
}
