import 'package:bloc/bloc.dart';
import 'package:clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:meta/meta.dart';

part 'fetatured_books_state.dart';

class FetaturedBooksCubit extends Cubit<FetaturedBooksState> {
  FetaturedBooksCubit() : super(FetaturedBooksInitial());
}
