// ignore_for_file: annotate_overrides

import 'package:flutter_store_app/core/store/store.dart';
import 'package:flutter_store_app/models/product.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends VxMutation<MyStore> {
  final Product item;

  AddToCart(this.item);
  @override
  MyStore store = VxState.store;
  perform() {
    store.cart.add(item);
    store.totalPrice += item.price;
  }
}
