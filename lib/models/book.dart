class Book {
  final String id;
  final String title;
  final String author;
  final String description;
  final double price;
  final String imageUrl;
  final String categoryId; // Link to the Category model

  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.categoryId,
  });
}