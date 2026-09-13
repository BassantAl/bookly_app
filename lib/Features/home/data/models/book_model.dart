import 'package:clean_arch/Features/home/domain/entities/book_entity.dart';

class BookModel extends BookEntity {
  final String id;
  final VolumeInfoModel volumeInfo;
  BookModel({required this.volumeInfo, required this.id})
    : super(
        bookId: id,
        authorName: volumeInfo.authors.isNotEmpty
            ? volumeInfo.authors.first
            : '',
        image: volumeInfo.imageLinks?.smallThumbnail ?? '',
        price: 0,
        title: volumeInfo.title,
        rating: volumeInfo.averageRating,
      );

  factory BookModel.fromJson({required Map<String, dynamic> data}) {
    return BookModel(
      id: data['id'] ?? '',
      volumeInfo: VolumeInfoModel.fromJson(
        data: Map<String, dynamic>.from(data['volumeInfo']),
      ),
    );
  }
}

class VolumeInfoModel {
  final String title;
  final String subtitle;
  final List<String> authors;
  final String publisher;
  final String publishedDate;
  final String description;
  final int pageCount;
  final num averageRating;
  final num ratingsCount;
  final ImageLinksModel? imageLinks;
  final String previewLink;

  VolumeInfoModel({
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.publisher,
    required this.publishedDate,
    required this.description,
    required this.pageCount,
    required this.averageRating,
    required this.ratingsCount,
    required this.imageLinks,
    required this.previewLink,
  });

  factory VolumeInfoModel.fromJson({required Map<String, dynamic> data}) {
    return VolumeInfoModel(
      title: data['title'] ?? '',
      subtitle: data['subtitle'] ?? '',
      authors: List<String>.from(data['authors'] ?? []),
      publisher: data['publisher'] ?? '',
      publishedDate: data['publishedDate'] ?? '',
      description: data['description'] ?? '',
      pageCount: data['pageCount'] ?? 0,
      averageRating: data['averageRating'] ?? 0,
      ratingsCount: data['ratingsCount'] ?? 0,
      imageLinks: data['imageLinks'] != null
          ? ImageLinksModel.fromJson(
              data: Map<String, dynamic>.from(data['imageLinks']),
            )
          : null,
      previewLink: data['previewLink'] ?? '',
    );
  }
}

class ImageLinksModel {
  final String smallThumbnail;
  final String thumbnail;
  ImageLinksModel({required this.smallThumbnail, required this.thumbnail});

  factory ImageLinksModel.fromJson({required Map<String, dynamic> data}) {
    return ImageLinksModel(
      smallThumbnail: data['smallThumbnail'] ?? '',
      thumbnail: data['thumbnail'] ?? '',
    );
  }
}
