import 'package:flutter/material.dart';

import 'CategoryProducts.dart';
 
class Category1 extends StatefulWidget {
  const Category1({Key? key}) : super(key: key);
  @override
  State<Category1> createState() => _Category1State();
}

class _Category1State extends State<Category1> {



  @override
  Widget build(BuildContext context) {
    //wrap CategoryProduct with listview to add scrool and Scrool direction
    return Container(
      height: 40,
            child: ListView(
        scrollDirection: Axis.horizontal,
        children: [

          CategoryProducts(
            press: () {

            },
            image: 'asset/images/products/product1.jpg',
            text: 'SmartWatch',
          ),
          SizedBox(
            width: 20,
          ),
          CategoryProducts(
            press: () {

            },
            image: 'asset/images/products/product7.webp',
            text: 'iPhone',
          ),

          SizedBox(width: 20,),

          CategoryProducts(
            press: () {

            },
            image: 'asset/images/products/product8.jpg',
            text: 'shoe',
          ),

          SizedBox(width: 20,),

          CategoryProducts(
            press: () {

            },
            image: 'asset/images/products/product11.png',
            text: 'skine',
          ),

          SizedBox(width: 20,),

          CategoryProducts(
            press: () {

            },
            image: 'asset/images/products/product2.webp',
            text: 'computer',
          ),

        ],
      ),
    );
  }
}
