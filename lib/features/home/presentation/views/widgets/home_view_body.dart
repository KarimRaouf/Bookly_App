import 'package:bookly_application_course/core/utils/assets.dart';
import 'package:bookly_application_course/core/utils/styles.dart';
import 'package:bookly_application_course/features/constants.dart';
import 'package:bookly_application_course/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly_application_course/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_application_course/features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:bookly_application_course/features/home/presentation/views/widgets/featured_lis_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            FeaturedBooksListView(),
            SizedBox(height: 50),
            Text('Best Seller', style: Styles.textStyle18),
            SizedBox(height: 20),
            BestSellerListViewItem(),
          ],
        ),
      ),
    );
  }
}


