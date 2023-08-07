import 'package:dartz/dartz.dart';
import 'package:my_bookly_clean_architecture/core/errors/failure.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> execute([Params params]);
}