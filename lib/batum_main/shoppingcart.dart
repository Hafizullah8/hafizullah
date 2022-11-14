import 'package:flutter/material.dart';

import '../Pages/batumbar.dart';
import '../enam.dart';
class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ShoppinCart"),
      ),
      bottomNavigationBar:BatumNavBar(selectedMenu: MenuState.shoppingCart,),
    );
  }
}
