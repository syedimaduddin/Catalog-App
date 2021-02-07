import 'package:first_flutter_app/core/store.dart';
import 'package:first_flutter_app/pages/cart_page.dart';
import 'package:first_flutter_app/utils/routes.dart';
import 'package:first_flutter_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(VxState(
    store: MyStore(),
    child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // int days = 1;
    // String name = "Imad";
    // double value = 1.24;
    // bool isMale = true;
    // num temp = 33.4; // 'num' can take both 'int' and 'double' values

    // var day = "Sunday";
    // const PI = 3.14;

    return MaterialApp(
        // home: HomePage(),
        themeMode: ThemeMode.light,
        // themeMode: ThemeMode.dark,
        theme: MyTheme.lightTheme(context),
        darkTheme: MyTheme.darkTheme(context),
        debugShowCheckedModeBanner: false,
        initialRoute: MyRoutes.homeRoute,
        routes: {
          // "/": (context) => LoginPage(),
          MyRoutes.homeRoute: (context) => HomePage(),
          MyRoutes.loginRoute: (context) => LoginPage(),
          MyRoutes.cartRoute: (context) => CartPage(),
        });
  }
}
