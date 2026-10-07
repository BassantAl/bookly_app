import 'package:bloc/bloc.dart';
import 'package:clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit({required this.fetchNewestBooksUseCase})
    : super(NewestBooksInitial());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());

    final result = await fetchNewestBooksUseCase.call();
    result.fold(
      ((failure) {
        emit(NewestBooksFailure(errorMessage: failure.errorMessage));
      }),
      (books) {
        emit(NewestBooksSuccess(books: books));
      },
    );
  }
}
