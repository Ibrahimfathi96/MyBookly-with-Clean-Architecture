import 'package:dartz/dartz.dart';
import 'package:my_bookly_clean_architecture/core/errors/failure.dart';
import 'package:my_bookly_clean_architecture/core/use_case/no_params_use_case.dart';
import 'package:my_bookly_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:my_bookly_clean_architecture/features/home/domain/repos/home_repo.dart';

class NoParams {}

class FetchFeaturedBooksUseCase extends NoParamsUseCase<List<BookEntity>> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> execute() async {
    return await homeRepo.fetchFeaturedBooks();
  }
}
