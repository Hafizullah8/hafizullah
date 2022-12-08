import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:mono_project/database.dart';
import 'package:mono_project/models/contact.dart';
import 'package:mono_project/personalizetion/userprofiler.dart';
import 'package:mono_project/variable.dart';
import 'package:flutter/widgets.dart';
import 'login.dart';
class SignupPage extends StatefulWidget{
  @override
  State<SignupPage> createState() => _SignupPageState();
}
class _SignupPageState extends State<SignupPage> {
  final _formKey=GlobalKey<FormState>();
  bool hide= true;
  Contact _contact=Contact();
  TextEditingController password= TextEditingController();
  TextEditingController confirmPassword= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40,left: 40),
              child: Text('Create your\n Account ', style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.w300,
              ),),
            ),
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
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text("Sign Up", style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w400,
                        fontSize: 45,
                      ),),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Email or username",
                        ),
                        onSaved:(val)=>setState(()=>_contact.setusername(val!)),
                        validator: (val)=>(val?.length==0 ?'this feild is requred':null),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: password,
                        obscureText: hide,
                        decoration: InputDecoration(
                          hintText: "password",
                          suffixIcon: IconButton(onPressed: (){
                            setState((){
                              hide = !hide;
                            });
                          },icon:hide?Icon(Icons.visibility_off) : Icon(Icons.visibility),),
                        ),
                        onSaved:(val)=>setState(()=>_contact.setpassword(val!)),
                        validator: (val)=>(val!.length<8 ?'At least 8 character requred':null),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: confirmPassword,
                        obscureText: hide,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
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
                          duration: 100,
                          enabled: true,
                          height: 40,
                          width: 200,onPressed: (){
                          if(password.text!=confirmPassword.text){
                            showDialog(context: context, builder: (context){
                              return AlertDialog(
                                title: Text("Message"),
                                content: Text("Password do not match each other"),
                              );
                            });
                          }else{
                            _onSubmit();
                          }
                        },child: Text("Sign Up",style: TextStyle(color: Colors.black),),),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an Account"),
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                          }, child: Text("Sign in ?"),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
  _onSubmit()async{
    var form = _formKey.currentState;
    if(form!.validate()){
      form.save();
      int? t =await databaseHandler?.insertInto(DatabaseHandler.tblname,_contact);
      setState((){_formKey.currentState!.reset();});
      if(t!=0){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfiler()));
      }

    }

  }
}