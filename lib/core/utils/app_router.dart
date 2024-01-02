import 'package:bookly_application_course/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_application_course/features/home/presentation/views/home_view.dart';
import 'package:bookly_application_course/features/out_of_scope_app/chat_GPT.dart';
import 'package:go_router/go_router.dart';

import '../../features/out_of_scope_app/deep_speech.dart';
import '../../features/out_of_scope_app/features.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../../test_code.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/BookDetailsView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => const BookDetailsView(),
      ),
    ],
  );
}
