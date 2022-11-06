import 'package:flutter/material.dart';

import '../Pages/batumbar.dart';
import '../enam.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      bottomNavigationBar:BatumNavBar(selectedMenu: MenuState.Profile,),
    );
  }
}
