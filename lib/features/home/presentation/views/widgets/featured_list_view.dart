import 'package:flutter/material.dart';
import 'package:my_bookly_clean_architecture/features/home/domain/entities/book_entity.dart';

import 'custom_book_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  final List<BookEntity> booksList;
  const FeaturedBooksListView({Key? key, required this.booksList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: booksList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: CustomBookImage(
              imageUrl: booksList[index].image ?? '',
            ),
          );
        },
      ),
    );
  }
}
