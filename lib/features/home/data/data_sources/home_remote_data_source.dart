import 'package:my_bookly_clean_architecture/core/utils/api_services.dart';
import 'package:my_bookly_clean_architecture/features/home/data/models/book_model/book_md.dart';
import 'package:my_bookly_clean_architecture/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImp(this.apiServices);
  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> booksList = [];
    for (var bookMap in data['items']) {
      booksList.add(BookMd.fromJson(bookMap));
    }
    return booksList;
  }

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiServices.get(
        endPoint: "volumes?Filtering=free-ebooks&q=programming");
    List<BookEntity> booksList = getBooksList(data);
    return booksList;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() {}
}
