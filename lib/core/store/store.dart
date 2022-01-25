import 'package:flutter_store_app/models/product.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  List<Product> cart = [];
  double totalPrice = 0;
}
