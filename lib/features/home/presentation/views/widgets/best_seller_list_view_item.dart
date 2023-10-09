
import 'package:bookly_application_course/core/utils/assets.dart';
import 'package:bookly_application_course/core/utils/styles.dart';
import 'package:bookly_application_course/features/constants.dart';
import 'package:flutter/material.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.5 / 4,
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
          ),
          const SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Harry potter and the Goblet of Fire',
                  style: Styles.textStyle20.copyWith(fontFamily: kGtSectraFine),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                const Text('J.K Rowling', style: Styles.textStyle14),
                Row(
                  children: [
                    Text('19.99 &', style: Styles.textStyle20.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
                    const SizedBox(width: 3),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
