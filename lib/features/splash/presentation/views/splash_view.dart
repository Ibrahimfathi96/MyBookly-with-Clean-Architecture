import 'package:flutter/material.dart';
import 'package:my_bookly_clean_architecture/features/splash/presentation/views/widgets/splash_view_body.dart';


class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
    
      body: SplashViewbody(),
    );
  }
}
