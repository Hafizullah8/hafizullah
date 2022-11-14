// we create material.dart package her
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mono_project/Pages/home_body.dart';
import 'package:mono_project/Pages/searchbar_section.dart';
import 'package:mono_project/enam.dart';
import 'package:mono_project/constant.dart';
import '../drawer.dart';
import 'batumbar.dart';
// create statefulwiged here and type stf and than show option
class HomeScreen extends StatefulWidget {


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor:kPrimaryColor,
        title: Center(child: Text("ShoppingStore")),
      ),
      backgroundColor: kBGColor,
      drawer: NevigationDrawer(),
      body: Homebody(),
      bottomNavigationBar:BatumNavBar(selectedMenu: MenuState.homescreen,),
    );
  }
}



