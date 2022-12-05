import 'package:flutter/material.dart';

class PaymentNotifier extends ChangeNotifier {
  int get minQuantityAllowed => 2;

  String productName = 'Apple Pie';
  late var productQuantity = minQuantityAllowed;
  int productPrice = 14000;

  int get totalPayment {
    return productQuantity * productPrice;
  }

  void onDecreaseQuantity() {
    if (productQuantity > minQuantityAllowed) {
      productQuantity = productQuantity - 1;
      notifyListeners();
    }
  }

  void onIncreaseQuantity() {
    productQuantity = productQuantity + 1;
    notifyListeners();
  }
}
