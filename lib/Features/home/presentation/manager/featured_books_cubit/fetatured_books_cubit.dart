import 'package:bloc/bloc.dart';
import 'package:clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:meta/meta.dart';

part 'fetatured_books_state.dart';

class FetaturedBooksCubit extends Cubit<FetaturedBooksState> {
  FetaturedBooksCubit({required this.fetchFeaturedBooksUseCase})
    : super(FetaturedBooksInitial());
  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  Future<void> fetchFeaturdBooks() async {
    emit(FetaturedBooksLoading());
    var result = await fetchFeaturedBooksUseCase.call();

    result.fold(
      (failure) {
        emit(FetaturedBooksFailure(errorMessage: failure.errorMessage));
      },
      (books) {
        emit(FetaturedBooksSuccess(books: books));
      },
    );
  }
}
