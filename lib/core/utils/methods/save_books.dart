  import 'package:clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:hive_ce/hive.dart';

void saveBooksData({required List<BookEntity> books , required String boxsName}) {
    var box = Hive.box(boxsName);
    box.addAll(books);
  }