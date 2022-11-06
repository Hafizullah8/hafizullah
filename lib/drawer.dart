import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mono_project/Pages/homescreeen.dart';
import 'package:mono_project/constant.dart';
import 'package:mono_project/personalizetion/mainformforminformation.dart';
import 'package:mono_project/userprofile.dart';

import 'login.dart';

class NevigationDrawer extends StatelessWidget {
  const NevigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>Drawer(
    child: SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildMenuItem(context),
        ],
      ),
    ),
  );
Widget buildHeader(BuildContext context)=> Material(
  color: Colors.black26,
  
  child:   InkWell(
    onTap: (){
      Navigator.pop(context);
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserPage()));
    },
    child: Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      margin: EdgeInsets.only(top:20),
      child: Column(
       children: [
         CircleAvatar(
           radius: 60,
           backgroundImage:AssetImage('asset/glasses/optic/male/obm5.webp'),

         ),
         SizedBox(height: 20,),

         Text("username"),

       ],

      ),

    ),
  ),
);

Widget buildMenuItem(BuildContext context)=>Container(
  padding: EdgeInsets.all(24),
  child:   Wrap(
    runSpacing: 16,
    children: [
      ListTile(
        leading: Icon(Icons.home),
        title: Text("Home"),
        onTap: ()=>
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen())),
      ),
      ListTile(
        leading: Icon(Icons.camera_outlined),
        title: Text("Change Content"),
        onTap: ()=>
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MainforminformationC())),
      ),
      SizedBox(height: 30,),
      ListTile(
        leading: IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage())) ;}, icon: Icon(Icons.logout),
        ),
        title: Text("Log_out"),
      ),


    ],
  ),
);

 
}




