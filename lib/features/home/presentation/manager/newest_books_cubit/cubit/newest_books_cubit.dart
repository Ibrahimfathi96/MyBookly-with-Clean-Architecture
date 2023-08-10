import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_bookly_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:my_bookly_clean_architecture/features/home/domain/use_cases/fetch_newest_books_use_case.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  Future<void> getNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await fetchNewestBooksUseCase.execute();
    result.fold(
      (failure) {
        emit(NewestBooksFailure(failure.message));
      },
      (booksList) {
        emit(NewestBooksSuccess(booksList));
      },
    );
  }
}
