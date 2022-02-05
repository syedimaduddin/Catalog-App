import 'package:first_flutter_app/models/catalog.dart';
import 'package:first_flutter_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.xl4.red500.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(MyTheme.darkBluishColor),
                shape: MaterialStateProperty.all(
                  StadiumBorder(),
                ),
              ),
              child: "Add to Cart".text.xl.make(),
            ).wh(130, 50),
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  color: Colors.white,
                  child: Column(
                    children: [
                      catalog.name.text.xl4
                          .color(MyTheme.darkBluishColor)
                          .make(),
                      catalog.desc.text.xl.color(Vx.gray400).make(),
                      10.heightBox,
                      "Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem v Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem vLorem vLorem Loremv LoremLorem LoremLoremLoremLoremLoremLoremLoremLorem Lorem".text.sm.color(Vx.gray400).make().p16(),
                    ],
                  ).py64(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
