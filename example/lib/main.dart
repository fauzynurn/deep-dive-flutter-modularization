import 'package:feature_a_module/presentation/payment/payment_notifier.dart';
import 'package:feature_a_module/presentation/payment/payment_page.dart';
import 'package:feature_a_module/presentation/payment/success_payment_page.dart';
import 'package:feature_a_module/presentation/payment/payment_page_param.dart';
import 'package:feature_a_module/presentation/product_preview/product_preview_notifier.dart';
import 'package:feature_a_module/presentation/product_preview/product_preview_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_payment/app_success_payment_page.dart';
import 'app_product_preview/app_product_preview_notifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductPreviewNotifier>(
          create: (_) => AppProductPreviewNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => PaymentNotifier(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ProductPreviewPage(),
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case ProductPreviewPage.routeName:
              return MaterialPageRoute(
                builder: (_) => const ProductPreviewPage(),
              );
            case PaymentPage.routeName:
              return MaterialPageRoute(
                builder: (_) => PaymentPage(
                  param: settings.arguments as PaymentPageParam,
                ),
              );
            case SuccessPaymentPage.routeName:
              return MaterialPageRoute(
                builder: (_) => const AppSuccessPaymentPage(),
              );
            default:
              return MaterialPageRoute(
                builder: (_) {
                  return const Scaffold(
                    body: Center(
                      child: Text('Page not found :('),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
