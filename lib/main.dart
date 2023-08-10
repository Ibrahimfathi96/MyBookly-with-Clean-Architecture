import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_bookly_clean_architecture/constants.dart';
import 'package:my_bookly_clean_architecture/core/utils/functions/setup_service_locator.dart';
import 'package:my_bookly_clean_architecture/core/utils/functions/simple_bloc_observer.dart';
import 'package:my_bookly_clean_architecture/core/utils/styles.dart';
import 'package:my_bookly_clean_architecture/features/home/data/repos/home_repo_impl.dart';
import 'package:my_bookly_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:my_bookly_clean_architecture/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:my_bookly_clean_architecture/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:my_bookly_clean_architecture/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:my_bookly_clean_architecture/features/home/presentation/manager/newest_books_cubit/cubit/newest_books_cubit.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  setupServiceLocator();
  await Hive.openBox<BookEntity>(kFeaturedBooks);
  await Hive.openBox<BookEntity>(kNewestBooks);
  Bloc.observer = SimpleBlocObserver();
  runApp(const CleanArchMyBookly());
}

class CleanArchMyBookly extends StatelessWidget {
  const CleanArchMyBookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => FeaturedBooksCubit(
            FetchFeaturedBooksUseCase(
              getIt.get<HomeRepoImpl>(),
            ),
          ),
        ),
        BlocProvider(
          create: (_) => NewestBooksCubit(
            FetchNewestBooksUseCase(
              getIt.get<HomeRepoImpl>(),
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
