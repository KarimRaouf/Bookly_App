import 'package:bookly_application_course/core/utils/assets.dart';
import 'package:flutter/material.dart';

class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(8),
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AssetData.testImage),
          ),
        ),
      ),
    );
  }
}
