import 'package:dartz/dartz.dart';
import 'package:my_bookly_clean_architecture/core/errors/failure.dart';
import 'package:my_bookly_clean_architecture/core/use_case/use_case.dart';
import 'package:my_bookly_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:my_bookly_clean_architecture/features/home/domain/repos/home_repo.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> execute(
      [int pageNumber = 0]) async {
    return await homeRepo.fetchFeaturedBooks(
      pageNumber: pageNumber,
    );
  }
}
