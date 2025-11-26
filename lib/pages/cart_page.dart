import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../data/dummy_data.dart';
import '../widgets/app_button.dart';
import '../pages/checkout_page.dart';

class CartPage extends StatelessWidget {
  static const routeName = '/cart';

  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mock Cart Data: Use the first two dummy books
    final cartItems = DUMMY_BOOKS.take(2).toList();
    double subtotal = cartItems.fold(0.0, (sum, item) => sum + item.price);
    final formatter = NumberFormat.currency(symbol: '\$');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart 🛒'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (ctx, index) {
                final item = cartItems[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(item.imageUrl),
                    onBackgroundImageError: (obj, stack) =>
                        const CircleAvatar(child: Icon(Icons.book)),
                  ),
                  title: Text(item.title),
                  subtitle: Text('Qty: 1 x ${formatter.format(item.price)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Removed ${item.title} (Mock)')),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          // --- Checkout Summary ---
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Subtotal:',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      formatter.format(subtotal),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                AppButton(
                  text: 'Proceed to Checkout (${formatter.format(subtotal)})',
                  onPressed: () {
                    Navigator.of(context).pushNamed(CheckoutPage.routeName);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}