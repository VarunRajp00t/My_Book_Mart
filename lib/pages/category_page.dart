import 'package:flutter/material.dart';
import '../models/category.dart';
import '../data/dummy_data.dart';
import '../widgets/book_tile.dart';

class CategoryPage extends StatelessWidget {
  static const routeName = '/category-books';

  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extract the Category object passed from HomePage
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    // Filter books by categoryId
    final categoryBooks = DUMMY_BOOKS.where((book) {
      return book.categoryId == category.id;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryBooks.length,
        itemBuilder: (ctx, index) {
          return BookTile(book: categoryBooks[index]);
        },
      ),
    );
  }
}