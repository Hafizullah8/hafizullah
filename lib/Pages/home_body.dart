import 'package:flutter/material.dart';
import 'package:mono_project/Pages/searchbar_section.dart';
import 'package:mono_project/Pages/slider.dart';
import 'package:mono_project/constant.dart';
import 'Products/Recommended.dart';
import 'Products/categrores.dart';
class Homebody extends StatefulWidget {
  const Homebody({Key? key}) : super(key: key);

  @override
  State<Homebody> createState() => _HomebodyState();
}

class _HomebodyState extends State<Homebody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // user safearea show appar but it is use here to show status bar
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          // the first we use column after we create slider we use list view instate of column
          child: ListView(
            children:[
              SearchbarSection(),
              SizedBox(height: 10),// search bar
              SliderProduct(), // slider
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Categores",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),),
                    SizedBox(width: 5,),
                    Row(
                      children: [
                        Text("All",style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                        ),),
                        Icon(Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 16,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                // if we shold use container to give height: ,becuase error ocured
                  height: 255,
                  child: Categores(),
              ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.arrow_back_ios ,size: 16,color: Colors.grey,),
                  Icon(Icons.arrow_back_ios_new_outlined,size: 16,color: Colors.grey,),
                  Text("Recommended For You",style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),),

                ],
              ),
              Container(
                // if we shold use container to give height: ,becuase error ocured
                height: 250,
                child:RecommendedProduct(),
              ),

            ],

          ),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
