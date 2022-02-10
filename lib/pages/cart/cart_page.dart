import 'package:flutter/material.dart';
import 'package:flutter_store_app/app_colors.dart';

import 'package:flutter_store_app/core/store/store.dart';
import 'package:flutter_store_app/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
            mutations: const {RemoveMutation},
            builder: (context, _, _a) {
              return (_cart.totalPrice.toDoubleStringAsFixed() + " ₺")
                  .text
                  .xl5
                  .color(appPrimaryColor)
                  .make();
            },
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Aktif değil.".text.make(),
              ));
            },
            child: "Buy".text.white.make(),
          ).w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Sepet henüz boş.".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: SizedBox(
                width: MediaQuery.of(context).size.width * 0.20,
                child: Image.network(_cart.items[index].image)
                    .box
                    .rounded
                    .color(creamColor)
                    .make()
                    .p4()
                    .expand(),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.remove_circle_outline,
                  color: Colors.red,
                ),
                onPressed: () => RemoveMutation(_cart.items[index]),
              ),
              title: _cart.items[index].title.text
                  .maxLines(2)
                  .color(appPrimaryColor)
                  .make()
                  .p16(),
            ),
          );
  }
}
