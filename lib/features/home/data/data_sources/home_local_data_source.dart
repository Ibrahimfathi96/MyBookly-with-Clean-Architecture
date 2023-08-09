import 'package:hive/hive.dart';
import 'package:my_bookly_clean_architecture/constants.dart';
import 'package:my_bookly_clean_architecture/features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var booksBox = Hive.box<BookEntity>(kFeaturedBooks);
    return booksBox.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var booksBox = Hive.box<BookEntity>(kNewestBooks);
    return booksBox.values.toList();
  }
}
