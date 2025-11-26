import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../data/dummy_data.dart';
import '../widgets/app_button.dart';

class BookDetailPage extends StatelessWidget {
  static const routeName = '/book-detail';

  const BookDetailPage({Key? key}) : super(key: key);

  // Mock function for "Add to Cart" logic
  void _addToCart(BuildContext context, String bookTitle) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('"$bookTitle" added to cart! (Mock Action)'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bookId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedBook = DUMMY_BOOKS.firstWhere((book) => book.id == bookId);
    final formatter = NumberFormat.currency(symbol: '\$');

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedBook.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Image Section
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedBook.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (ctx, obj, stack) => Container(
                  color: Colors.grey,
                  child: const Center(child: Icon(Icons.book, size: 100)),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selectedBook.title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'by ${selectedBook.author}',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    formatter.format(selectedBook.price),
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    selectedBook.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: AppButton(
                      text: 'Add to Cart',
                      onPressed: () => _addToCart(context, selectedBook.title),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}