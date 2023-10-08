import 'package:bookly_application_course/core/utils/assets.dart';
import 'package:bookly_application_course/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_application_course/features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          FeaturedBooksListView(),
        ],
      ),
    );
  }
}

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: FeaturedListViewItem(),
        ),
        itemCount: 5,
      ),
    );
  }
}
