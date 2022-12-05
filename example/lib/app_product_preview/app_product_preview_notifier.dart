import 'package:feature_a_module/presentation/product_preview/product_preview_notifier.dart';

class AppProductPreviewNotifier extends ProductPreviewNotifier {
  @override
  int get minQuantityAllowed => 4;
}
