import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../widgets/book_tile.dart';
import '../models/book.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/search';

  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchText = '';
  List<Book> _searchResults = [];

  void _runFilter(String enteredKeyword) {
    List<Book> results = [];
    if (enteredKeyword.isEmpty) {
      // If the search field is empty, show all books
      results = DUMMY_BOOKS;
    } else {
      results = DUMMY_BOOKS
          .where((book) =>
              book.title.toLowerCase().contains(enteredKeyword.toLowerCase()) ||
              book.author.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _searchText = enteredKeyword;
      _searchResults = results;
    });
  }

  @override
  void initState() {
    // Initially display all books
    _searchResults = DUMMY_BOOKS;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Books'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                hintText: 'Search by title or author...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: _searchResults.isEmpty
          ? Center(
              child: Text(
                _searchText.isEmpty
                    ? 'Start typing to search!'
                    : 'No results found for "$_searchText"',
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                return BookTile(book: _searchResults[index]);
              },
            ),
    );
  }
}