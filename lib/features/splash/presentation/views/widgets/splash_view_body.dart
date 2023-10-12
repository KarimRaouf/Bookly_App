import 'dart:ffi';

import 'package:bookly_application_course/core/utils/app_router.dart';
import 'package:bookly_application_course/core/utils/assets.dart';
import 'package:bookly_application_course/features/constants.dart';
import 'package:bookly_application_course/features/home/presentation/views/home_view.dart';
import 'package:bookly_application_course/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();

    initSlidingAnimation();

    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AssetData.logo),
          const SizedBox(height: 10),
          SlidingText(slidingAnimation: slidingAnimation),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
  }

  Future<void> navigateToHome() async {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        // Get.to(
        //   () => const HomeView(),
        //   transition: Transition.fade,
        //   duration: kTransitionDuration,
        // );

        GoRouter.of(context).push(AppRouter.kHomeView);
      },
    );
  }
}
