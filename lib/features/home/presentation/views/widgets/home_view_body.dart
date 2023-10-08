import 'package:bookly_application_course/core/utils/assets.dart';
import 'package:bookly_application_course/core/utils/styles.dart';
import 'package:bookly_application_course/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_application_course/features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:bookly_application_course/features/home/presentation/views/widgets/featured_lis_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            FeaturedBooksListView(),
            SizedBox(height: 50),
            Text('Best Seller', style: Styles.titleMedium),
            BestSellerListViewItem(),
          ],
        ),
      ),
    );
  }
}

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
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
        ],
      ),
    );
  }
}
