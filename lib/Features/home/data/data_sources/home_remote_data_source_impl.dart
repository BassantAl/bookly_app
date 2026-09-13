import 'package:clean_arch/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:clean_arch/Features/home/data/models/book_model.dart';
import 'package:clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch/core/utils/services/api_services.dart';
import 'package:clean_arch/keys.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiServices apiServices;
  HomeRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiServices.get(
      endPoint: 'volumes?key=$apiKey&q=programming&Filtering=free-ebooks',
    );
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiServices.get(
      endPoint:
          'volumes?key=$apiKey&q=programming&Filtering=free-ebooks&Sorting=newest',
    );
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var element in data['items']) {
      books.add(BookModel.fromJson(data: element));
    }
    return books;
  }
}
