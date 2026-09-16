import 'package:clean_arch/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch/constants.dart';
import 'package:hive_ce/hive.dart';

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookEntity>(kFeatureBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
}
