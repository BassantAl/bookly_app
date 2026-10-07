part of 'fetatured_books_cubit.dart';

@immutable
sealed class FetaturedBooksState {}

final class FetaturedBooksInitial extends FetaturedBooksState {}

final class FetaturedBooksLoading extends FetaturedBooksState {}

final class FetaturedBooksFailure extends FetaturedBooksState {
  final String errorMessage;
  FetaturedBooksFailure({required this.errorMessage});
}

final class FetaturedBooksSuccess extends FetaturedBooksState {
  final List<BookEntity> books;
  FetaturedBooksSuccess({required this.books});
}
