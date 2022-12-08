import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mono_project/Pages/homescreeen.dart';

import 'package:mono_project/personalizetion/userprofiler.dart';
import 'package:mono_project/batum_main/userprofile.dart';
import 'package:mono_project/variable.dart';

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
        onTap: () async{
          await databaseHandler.deletet();
          productListg=[];
          productList=[];
          Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfiler()));
        }
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




