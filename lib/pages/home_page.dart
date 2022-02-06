import 'package:first_flutter_app/models/catalog.dart';
import 'package:first_flutter_app/utils/routes.dart';
import 'package:first_flutter_app/widgets/home_widgets/catalog_header.dart';
import 'package:first_flutter_app/widgets/home_widgets/catalog_list.dart';
import 'package:first_flutter_app/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 1;

  final String name = "Imad";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    // print(decodedData);
    final productsData = decodedData["products"];
    // print(productsData);
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(50, (index) => CatalogModel.items[0]);
    return Scaffold(
        // appBar: AppBar(
        //   title: Padding(
        //     padding: const EdgeInsets.all(16.0),
        //     child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
        //         ?
        //         // ListView.builder(
        //         //   itemCount: CatalogModel.items.length,
        //         //   // itemCount: dummyList.length,
        //         //   itemBuilder: (context, index) =>
        //         //     ItemWidget(
        //         //       item: CatalogModel.items[index],
        //         //       // item: dummyList[index],
        //         //     ),
        //         // )
        //         GridView.builder(
        //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //                 crossAxisCount: 2,
        //                 mainAxisSpacing: 16,
        //                 crossAxisSpacing: 16,
        //                 ),
        //             itemBuilder: (context, index) {
        //               final item = CatalogModel.items[index];
        //               return Card(
        //                 clipBehavior: Clip.antiAlias,
        //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        //               child: GridTile(
        //                 header: Container(
        //                   child: Text(
        //                     item.name,
        //                     style: TextStyle(
        //                       color: Colors.white,
        //                     ),
        //                   ),
        //                   padding: const EdgeInsets.all(12),
        //                   decoration: BoxDecoration(
        //                     color: Colors.deepPurple,
        //                   ),
        //                 ),
        //                 child: Image.network(item.image),
        //                 footer: Container(
        //                   child: Text(
        //                     item.price.toString(),
        //                     style: TextStyle(
        //                       color: Colors.white,
        //                     ),
        //                   ),
        //                   padding: const EdgeInsets.all(12),
        //                   decoration: BoxDecoration(
        //                     color: Colors.black,
        //                   ),
        //                 ),
        //                 ),
        //               );
        //             },
        //             itemCount: CatalogModel.items.length,
        //           )
        //         : Center(
        //             child: CircularProgressIndicator(),
        //           ),
        //   ),
        // ),
        // body: Center(
        //   child: Container(
        //     child: Text("I'm $name, Welcome to my ${days}st Flutter App."),
        //   ),
        // ),
        // drawer: MyDrawer(),

        // backgroundColor: MyTheme.creamColor,
        backgroundColor: context.canvasColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: context.theme.buttonColor,
          child: Icon(CupertinoIcons.cart, color: Colors.white,),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().py16().expand()
                else
                   CircularProgressIndicator().centered().expand(),

              ],
            ),
          ),
        )
    );
  }
}