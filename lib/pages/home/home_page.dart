import 'package:flutter/material.dart';
import 'package:flutter_store_app/app_colors.dart';
import 'package:flutter_store_app/components/drawer.dart';
import 'package:flutter_store_app/components/item_widget.dart';
import 'package:flutter_store_app/models/product.dart';
import 'package:flutter_store_app/services/api_service.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      backgroundColor: creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              const CatalogList().expand(),
            ],
          ),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}

class CatalogList extends StatefulWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  _CatalogListState createState() => _CatalogListState();
}

class _CatalogListState extends State<CatalogList> {
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: APIService.getProdcut(),
          builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
              snapshot.hasData
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ItemWidget(
                          item: snapshot.data![index],
                        );
                      },
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
        ));
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "StoreApp".text.xl6.bold.color(appPrimaryColor).make(),
        "Trending Prodcut".text.xl.make(),
      ],
    );
  }
}
