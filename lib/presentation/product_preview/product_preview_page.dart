import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../payment/payment_page.dart';
import '../payment/payment_page_param.dart';
import 'product_preview_notifier.dart';

class ProductPreviewPage extends StatefulWidget {
  static const routeName = '/product-preview';
  const ProductPreviewPage({super.key});

  @override
  State<ProductPreviewPage> createState() => ProductPreviewPageState();
}

class ProductPreviewPageState extends State<ProductPreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Preview',
        ),
      ),
      body: Consumer<ProductPreviewNotifier>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Expanded(
                child: productDescription(provider),
              ),
              payButton(provider)
            ],
          );
        },
      ),
    );
  }

  Widget quantityChooser(ProductPreviewNotifier notifier) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(
            Icons.remove,
          ),
          onPressed: notifier.onDecreaseQuantity,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          '${notifier.productQuantity}',
        ),
        const SizedBox(
          width: 8,
        ),
        IconButton(
          icon: const Icon(
            Icons.add,
          ),
          onPressed: notifier.onIncreaseQuantity,
        ),
      ],
    );
  }

  Widget payButton(ProductPreviewNotifier notifier) {
    return Padding(
      padding: const EdgeInsets.all(
        12,
      ),
      child: SizedBox(
        width: double.infinity,
        child: MaterialButton(
          color: Colors.green,
          onPressed: () => onPressPayButton(
            context,
            productName: notifier.productName,
            productPrice: notifier.productPrice,
            productQuantity: notifier.productQuantity,
          ),
          child: const Text(
            'Pay',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget productDescription(ProductPreviewNotifier provider) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'packages/feature_a_module/assets/images/apple-pie.jpg',
            width: 300,
            height: 300,
          ),
          Text(
            provider.productName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          quantityChooser(provider),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Rp${provider.totalPayment}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void onPressPayButton(
    BuildContext context, {
    required String productName,
    required int productPrice,
    required int productQuantity,
  }) {
    Navigator.pushNamed(
      context,
      PaymentPage.routeName,
      arguments: PaymentPageParam(
        productName: productName,
        productPrice: productPrice,
        quantity: productQuantity,
      ),
    );
  }
}
