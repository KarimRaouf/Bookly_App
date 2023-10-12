import 'package:bookly_application_course/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key, this.mainAxisAlignment = MainAxisAlignment.start,});

  final mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: const [
        Icon(FontAwesomeIcons.solidStar, color: Color(0xffFFDD4F),size: 14,),
        SizedBox(width: 6.3),
        Text('4.8', style: Styles.textStyle16,),
        SizedBox(width: 5),
        Opacity(opacity: 0.5,child: Text('(245)', style: Styles.textStyle14)),
      ],
    );
  }
}