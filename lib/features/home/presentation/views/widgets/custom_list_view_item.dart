import 'package:bookly_application_course/core/utils/assets.dart';
import 'package:flutter/material.dart';

class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: AspectRatio(
        aspectRatio: 2.7/4,
        child: Container(
          decoration:  const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(AssetData.testImage),
            ),
          ),
        ),
      ),
    );
  }
}
