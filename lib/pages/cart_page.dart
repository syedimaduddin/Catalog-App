import 'package:first_flutter_app/core/store.dart';
import 'package:first_flutter_app/models/cart.dart';
import 'package:first_flutter_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.xl3.color(context.theme.buttonColor).make(),
      ),
      body: Column(
        children: [
          // Placeholder().p32().expand(),
          _CartList().p32().expand(),
          Divider(),
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
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // VxConsumer(
          //     mutations: {RemoveMutation},
          //     notifications: {},
          //     builder: (context, dynamic, _) {
          //       return "\$${_cart.totalPrice}".text.xl5.color(context.accentColor).make();
          //     },
          // ),
          VxBuilder(
              mutations: {RemoveMutation},
              builder: (context, dynamic, _) {
                return "\$${_cart.totalPrice}".text.xl5.color(context.accentColor).make();
              },
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: "Buying not supported yet.".text.make()));
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.theme.buttonColor)),
            child: "Buy".text.color(Colors.white).make(),
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
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () => RemoveMutation(_cart.items[index]),
                // _cart.remove(_cart.items[index]);
                // setState(() {});
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
