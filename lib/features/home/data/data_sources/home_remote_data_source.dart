import 'package:my_bookly_clean_architecture/constants.dart';
import 'package:my_bookly_clean_architecture/core/utils/api_services.dart';
import 'package:my_bookly_clean_architecture/core/utils/functions/caching_data.dart';
import 'package:my_bookly_clean_architecture/features/home/data/models/book_model/book_md.dart';
import 'package:my_bookly_clean_architecture/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
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
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiServices.get(
        endPoint: "volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumber*10}");
    List<BookEntity> booksList = getBooksList(data);
    cachingBooksDataLocally(booksList,kFeaturedBooks);
    return booksList;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiServices.get(
        endPoint:"volumes?Filtering=free-ebooks&Sorting=newest&q=programming" );
    List<BookEntity> booksList = getBooksList(data);
    cachingBooksDataLocally(booksList,kNewestBooks);
    return booksList;
  }
}
