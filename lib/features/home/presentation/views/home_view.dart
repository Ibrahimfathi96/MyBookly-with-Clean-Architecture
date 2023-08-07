import 'package:flutter/material.dart';
import 'package:my_bookly_clean_architecture/constants.dart';
import 'package:my_bookly_clean_architecture/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:my_bookly_clean_architecture/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        title: const CustomAppBAr(),
      ),
      body: HomeViewBody(),
    );
  }
}
