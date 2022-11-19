import 'package:flutter/material.dart';
import '../constant.dart';
class SearchbarSection extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return     Column(
      children:[
        SizedBox(
          height: 60,
          child: Row(
          children:[
              SizedBox(width: 20,),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow:[
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 4,
                      ),
                    ],),
                  child: TextField(
                    decoration: InputDecoration(
                      // remove bar
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),),
            Container(
              child:IconButton(onPressed: () {  }, icon: Icon(Icons.search),),
            ),
              // search iconse

            ],
          ),
        ),
      ],
    );
  }
}





