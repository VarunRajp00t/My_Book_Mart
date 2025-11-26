import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // Needed for NumberFormat in book_tile
import './pages/home_page.dart';
import './pages/category_page.dart';
import './pages/book_detail_page.dart';
import './pages/cart_page.dart';
import './pages/checkout_page.dart';
import './pages/search_page.dart';

void main() {
  runApp(const BookStoreApp());
}

class BookStoreApp extends StatelessWidget {
  const BookStoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          color: Colors.blue,
          titleTextStyle: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
      localizationsDelegates: const [
        // Required for currency formatting in book_tile.dart
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English
      ],
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (ctx) => const HomePage(),
        CategoryPage.routeName: (ctx) => const CategoryPage(),
        BookDetailPage.routeName: (ctx) => const BookDetailPage(),
        CartPage.routeName: (ctx) => const CartPage(),
        CheckoutPage.routeName: (ctx) => const CheckoutPage(),
        SearchPage.routeName: (ctx) => const SearchPage(),
      },
      // Fallback route if a named route is not found
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => const HomePage(),
        );
      },
    );
  }
}