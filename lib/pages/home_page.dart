import 'package:first_flutter_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 1;
  final String name = "Imad";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Container(
          child: Text("I'm $name, Welcome to my ${days}st Flutter App."),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
