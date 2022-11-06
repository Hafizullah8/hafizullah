import 'package:flutter/material.dart';
import 'package:mono_project/variable.dart';
import 'package:flutter/widgets.dart';
import 'login.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await databaseHandler.initializeDB();
  runApp(MaterialApp(home: LoginPage(),));
}











