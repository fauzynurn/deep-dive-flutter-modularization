import 'package:flutter/material.dart';

class SuccessPaymentPage extends StatelessWidget {
  static const routeName = '/success-payment';
  const SuccessPaymentPage({super.key});

  Widget successIcon() {
    return const Icon(
      Icons.emoji_emotions,
      color: Colors.green,
      size: 100,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            successIcon(),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Payment success!',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
