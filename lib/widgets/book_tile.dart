import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/book.dart';
import '../pages/book_detail_page.dart';

class BookTile extends StatelessWidget {
  final Book book;

  const BookTile({Key? key, required this.book}) : super(key: key);

  void _selectBook(BuildContext context) {
    Navigator.of(context).pushNamed(
      BookDetailPage.routeName,
      arguments: book.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Format the price to currency
    final formatter = NumberFormat.currency(symbol: '\$');

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () => _selectBook(context),
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Book Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  book.imageUrl,
                  height: 100,
                  width: 70,
                  fit: BoxFit.cover,
                  errorBuilder: (ctx, obj, stack) => Container(
                    height: 100,
                    width: 70,
                    color: Colors.grey,
                    child: const Center(child: Icon(Icons.book)),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              // Book Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      book.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      book.author,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      formatter.format(book.price),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}