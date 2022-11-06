import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:mono_project/database.dart';
import 'package:mono_project/models/contact.dart';
import 'package:mono_project/pages/homescreeen.dart';
import 'package:mono_project/signup.dart';
import 'package:mono_project/variable.dart';
import 'package:flutter/widgets.dart';
class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPageState();

}
class _LoginPageState extends State<LoginPage> {
  bool hide= true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey1=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40,left: 40),
            child: Text('Shopping \n Store ', style: TextStyle(
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.w300,
            ),),),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.5),
            width: double.infinity,
            height: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50),),
            ),
            child: Form(
              key: _formKey1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Log In", style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w400,
                    fontSize: 45,
                  ),),
                  Expanded(
                    child: TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        hintText: "username",
                      ),
                      validator: (val)=>(val?.length==0 ?'this feild is requred':null),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: hide,
                      onChanged: (value) {
                        String username = value;
                      },
                      decoration: InputDecoration(
                        hintText: "password",
                        suffixIcon: IconButton(onPressed: (){
                          setState((){
                            hide = !hide;
                          });
                        },icon:hide?Icon(Icons.visibility_off) : Icon(Icons.visibility),),
                      ),
                      validator: (val)=>(val!.length<8 ?'At least 8 character requred':null),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: AnimatedButton(
                        color: Colors.greenAccent,
                        enabled: true,
                        duration: 50,
                        height: 40,  		// Button Height, default is 64
                        width: 160, onPressed: ()async{
                        var form1 = _formKey1.currentState;
                        if(form1!.validate())  {
                          String username = usernameController.value.text;
                          String password = passwordController.value.text;
                          List contactlist=await databaseHandler.retrieveData(DatabaseHandler.tblname);
                          for(var usermodel in contactlist){
                            if(Contact.fromMap(usermodel).getusername()==username){
                              for(var passmodel in contactlist){
                                if(Contact.fromMap(passmodel).getpassword()==password){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                                }
                              }
                            }
                          }
                        }
                      },child: Text("Log in",style: TextStyle(color: Colors.black),),),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));
                        }, child: Text("Sign Up ?"),),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: (){}, child: Text("Forgot passwor?"),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}