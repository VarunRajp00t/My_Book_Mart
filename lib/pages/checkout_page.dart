import 'package:flutter/material.dart';
import '../widgets/app_button.dart';

class CheckoutPage extends StatelessWidget {
  static const routeName = '/checkout';

  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Shipping & Payment Information',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Address Line 1',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Credit Card Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const Spacer(),
            Center(
              child: AppButton(
                text: 'Place Order',
                onPressed: () {
                  // Mock order placement
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Order Placed! 🎉'),
                      content: const Text(
                          'Thank you for your purchase. Your order is being processed. (Mock)'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            // Navigate back to the home page
                            Navigator.of(ctx).popUntil((route) => route.isFirst);
                          },
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}