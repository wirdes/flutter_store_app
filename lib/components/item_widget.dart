// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store_app/app_colors.dart';
import 'package:flutter_store_app/models/product.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemWidget extends StatefulWidget {
  final Product item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  bool isPresed = false;
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(image: widget.item.image, id: widget.item.id.toString()),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.item.title.text.bold
                .maxLines(1)
                .lg
                .color(appPrimaryColor)
                .make(),
            widget.item.description.text.maxLines(2).xs.make(),
            (MediaQuery.of(context).size.height * 0.05).heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (widget.item.price.toString() + " ₺").text.bold.make(),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isPresed = !isPresed;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: isPresed
                              ? "Product Added from Cart".text.make()
                              : "Product Remove from Cart".text.make()));
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all(const StadiumBorder())),
                    child: isPresed
                        ? const Icon(Icons.done)
                        : const Icon(CupertinoIcons.cart_badge_plus))
              ],
            ).pOnly(right: 8)
          ],
        ))
      ],
    )).white.p8.roundedLg.square(180).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  const CatalogImage({
    Key? key,
    required this.image,
    required this.id,
  }) : super(key: key);

  final String image;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: id,
      child: Image.network(image)
          .box
          .rounded
          .p8
          .color(creamColor)
          .make()
          .p16()
          .w32(context),
    );
  }
}
