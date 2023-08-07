import 'package:flutter/material.dart';
import 'package:my_bookly_clean_architecture/features/search/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  static const String routeName = '/searchView';
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SearchViewBody(),
      ),
    );
  }
}
