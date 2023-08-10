import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_bookly_clean_architecture/core/errors/failure.dart';
import 'package:my_bookly_clean_architecture/features/home/data/data_sources/home_local_data_source.dart';
import 'package:my_bookly_clean_architecture/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:my_bookly_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:my_bookly_clean_architecture/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepoImpl(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0}) async {
    try {
      List<BookEntity> booksList;
      booksList = homeLocalDataSource.fetchFeaturedBooks();
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      booksList = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(booksList);
    } catch (errMessage) {
      if (errMessage is DioException) {
        return left(ServerFailure.fromDioError(errMessage));
      }
      return left(ServerFailure(errMessage.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> booksList;
      booksList = homeLocalDataSource.fetchNewestBooks();
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      booksList = await homeRemoteDataSource.fetchNewestBooks();
      return right(booksList);
    } catch (errMessage) {
      if (errMessage is DioException) {
        return left(ServerFailure.fromDioError(errMessage));
      }
      return left(ServerFailure(errMessage.toString()));
    }
  }
}
