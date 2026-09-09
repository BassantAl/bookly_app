import 'package:clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch/Features/home/domain/repos/home_repo.dart';
import 'package:clean_arch/core/errors/failure.dart';
import 'package:clean_arch/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

// class FetchFeaturedBooksUseCase  {
//   final HomeRepo homeRepo;
//   FetchFeaturedBooksUseCase({required this.homeRepo});

//   // call method  execute use case
//   Future<Either<Failure, List<BookEntity>>> call() {
//     // check permssion
//     return homeRepo.fetchFeaturedBooks();
//   }
// }

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, NoParam> {
  final HomeRepo homeRepo;
  FetchFeaturedBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) async{
    return await homeRepo.fetchFeaturedBooks();
  }
}

// // give me any data type // type present data type
// abstract class UseCase<type, Param> {
//   Future<Either<Failure, type>> call([Param param]);
// }

// class NoParam {}
