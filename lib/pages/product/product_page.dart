import 'package:flutter/material.dart';
import 'package:flutter_store_app/app_colors.dart';
import 'package:flutter_store_app/models/product.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product item;
  const ProductDetailsPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (item.price.toString() + " ₺")
                .text
                .xl3
                .color(appPrimaryColor)
                .bold
                .make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all(const StadiumBorder())),
                    child: "Add".text.xl2.make())
                .w40(context)
                .h4(context)
          ],
        ).pOnly(right: 8).h15(context).p24(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: creamColor,
      body: SafeArea(
        child: Column(
          children: [
            Hero(tag: item.id.toString(), child: Image.network(item.image))
                .h20(context)
                .p8(),
            Expanded(
                child: VxArc(
              height: 30,
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    35.heightBox,
                    item.title.text.bold
                        .maxLines(2)
                        .lg
                        .xl4
                        .color(appPrimaryColor)
                        .make()
                        .p32(),
                    item.description.text.maxLines(5).make(),
                    10.heightBox,
                  ],
                ).p32(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
