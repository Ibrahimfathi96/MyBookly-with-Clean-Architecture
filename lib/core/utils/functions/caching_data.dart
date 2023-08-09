import 'package:hive/hive.dart';
import 'package:my_bookly_clean_architecture/features/home/domain/entities/book_entity.dart';

void cachingBooksDataLocally(List<BookEntity> booksList, String boxName) {
    var booksBox = Hive.box(boxName);
    booksBox.addAll(booksList);
  }