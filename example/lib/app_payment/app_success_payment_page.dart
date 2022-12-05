import 'package:feature_a_module/presentation/payment/success_payment_page.dart';
import 'package:flutter/material.dart';

class AppSuccessPaymentPage extends SuccessPaymentPage {
  const AppSuccessPaymentPage({super.key});

  @override
  Widget successIcon() {
    return const Icon(
      Icons.check,
      color: Colors.green,
      size: 100,
    );
  }
}
