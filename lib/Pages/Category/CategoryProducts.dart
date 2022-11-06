import 'package:flutter/material.dart';
import 'package:mono_project/constant.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({Key? key, required this.image, required this.text, required this.press}) : super(key: key);
  final String image,text;
  final  VoidCallback press;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: press,
        child: Container(
          child: Chip(
            backgroundColor: kPrimaryColor,
            label: Row(
            children: [
              Image.asset(image,height: 40,),

              SizedBox( width: 20,),
              Text(text),

            ],
          ),),
        ),
      ),
    );
  }
}


