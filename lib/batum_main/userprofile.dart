import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Pages/batumbar.dart';
import '../enam.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('username'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 2),
                  height: 400,
                  width: 420,
                    child: Image(
                        image: AssetImage('asset/glasses/optic/male/obm5.webp'),
                      fit: BoxFit.cover,
                    ),


                ),
              ),

            ],
          ),
        ],
      ),
      bottomNavigationBar:BatumNavBar(selectedMenu: MenuState.profile,),
    );
  }
}
