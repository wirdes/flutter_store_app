import 'package:flutter/material.dart';
import 'package:flutter_store_app/app_colors.dart';
import 'package:flutter_store_app/core/store/store.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);
  final MyStore store = VxState.store;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.bold.xl4.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          const Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final MyStore store = VxState.store;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (store.totalPrice.toString() + " ₺")
                .text
                .color(appPrimaryColor)
                .bold
                .xl5
                .make()
                .p16(),
            30.widthBox,
            ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: "Not Support".text.make()));
                    },
                    child: "Buy".text.bold.xl2.make().p16())
                .w32(context)
                .p16()
          ],
        ));
  }
}

class _CartList extends StatelessWidget {
  _CartList({Key? key}) : super(key: key);
  MyStore store = VxState.store;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: store.cart.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(
          Icons.done,
          color: appPrimaryColor,
        ),
        trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.remove_circle_outline,
              color: Colors.red,
            )),
        title: (store.cart[index].title).text.maxLines(1).make(),
      ),
    );
  }
}
