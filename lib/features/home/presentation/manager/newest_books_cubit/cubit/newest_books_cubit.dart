import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_bookly_clean_architecture/features/home/domain/entities/book_entity.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit() : super(NewestBooksInitial());
}
