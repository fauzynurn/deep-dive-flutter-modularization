import 'package:feature_a_module/presentation/payment/payment_page_param.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'payment_notifier.dart';
import 'success_payment_page.dart';

class PaymentPage extends StatefulWidget {
  static const routeName = '/payment';
  final PaymentPageParam param;
  int get totalPayment {
    return param.quantity * param.productPrice;
  }

  const PaymentPage({
    super.key,
    required this.param,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment',
        ),
      ),
      body: Consumer<PaymentNotifier>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Expanded(
                child: productDescription(provider),
              ),
              paySection(provider)
            ],
          );
        },
      ),
    );
  }

  Widget productDescription(PaymentNotifier notifier) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Product Name',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: Text(
                  widget.param.productName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.end,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            children: [
              const Text(
                'Product Price',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: Text(
                  'Rp${widget.param.productPrice}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.end,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            children: [
              const Text(
                'Product Quantity',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: Text(
                  '${widget.param.quantity}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.end,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget paySection(PaymentNotifier notifier) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: const Offset(0, -1),
            spreadRadius: 3,
            blurRadius: 7,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          16,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Payment',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Rp${widget.totalPayment}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              color: Colors.green,
              onPressed: () => onPressPayButton(
                context,
                notifier,
              ),
              child: const Text(
                'Pay Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPressPayButton(
    BuildContext context,
    PaymentNotifier notifier,
  ) {
    Navigator.pushNamed(
      context,
      SuccessPaymentPage.routeName,
    );
  }
}
