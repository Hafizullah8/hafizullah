import 'package:flutter/material.dart';

import '../Pages/batumbar.dart';
import '../enam.dart';
class Favorit extends StatefulWidget {
  const Favorit({Key? key}) : super(key: key);

  @override
  State<Favorit> createState() => _FavoritState();
}

class _FavoritState extends State<Favorit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
      ),
      bottomNavigationBar:BatumNavBar(selectedMenu: MenuState.favorite,),
    );
  }
}
