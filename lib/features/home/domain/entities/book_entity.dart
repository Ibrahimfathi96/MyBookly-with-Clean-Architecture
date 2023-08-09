class BookEntity {
  final String bookId;
  final String? image;
  final String title;
  final num? price;
  final String? authorName;
  final num? rating;

  BookEntity({
    required this.bookId,
    required this.image,
    required this.title,
    required this.price,
    required this.authorName,
    required this.rating,
  });
}
