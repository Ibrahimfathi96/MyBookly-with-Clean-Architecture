import 'package:go_router/go_router.dart';
import 'package:my_bookly_clean_architecture/features/home/presentation/views/book_details_view.dart';
import 'package:my_bookly_clean_architecture/features/home/presentation/views/home_view.dart';
import 'package:my_bookly_clean_architecture/features/search/presentation/views/search_view.dart';
import 'package:my_bookly_clean_architecture/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
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