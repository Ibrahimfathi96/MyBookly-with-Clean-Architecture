import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:my_bookly_clean_architecture/constants.dart';
import 'package:my_bookly_clean_architecture/core/utils/styles.dart';
import 'package:my_bookly_clean_architecture/features/home/domain/entities/book_entity.dart';

void main() async{
  runApp(const CleanArchMyBookly());
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox(kFeaturedBooks);
}

class CleanArchMyBookly extends StatelessWidget {
  const CleanArchMyBookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: GoogleFonts.montserratTextTheme(
          ThemeData.dark().textTheme,
        ),
      ),
    );
  }
}
