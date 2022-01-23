import 'package:flutter/material.dart';
import 'package:flutter_store_app/app_colors.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

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
          const _CartList().p32().expand(),
          const Divider(),
          const _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "999 ₺".text.color(appPrimaryColor).bold.xl5.make().p16(),
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

class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
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
        title: ("item " + index.toString()).text.make(),
      ),
    );
  }
}
