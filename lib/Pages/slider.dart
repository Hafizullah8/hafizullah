
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:mono_project/constant.dart';
class SliderProduct extends StatefulWidget {
  const SliderProduct({Key? key}) : super(key: key);

  @override
  State<SliderProduct> createState() => _SliderProductState();
}
class _SliderProductState extends State<SliderProduct> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: Container(
          height: 200,
          child:Expanded(
            child: Carousel(
              images:[
                AssetImage('asset/images/image1.jpg'),
                AssetImage('asset/images/image2.jpg'),
                AssetImage('asset/images/products/product1.jpg'),
                AssetImage('asset/images/products/product9.jpg'),
                AssetImage('asset/images/products/product8.jpg'),
                AssetImage('asset/images/products/eyeglasses.jpg'),
                AssetImage('asset/images/products/slider/images1.jpg'),
                AssetImage('asset/images/products/slider/leman.jpg'),
                AssetImage('asset/images/products/slider/raban.jpg'),
                AssetImage('asset/images/products/slider/Shoes_large.jpg'),
                AssetImage('asset/images/products/slider/shoesadidass.jpg'),
                AssetImage('asset/images/products/slider/swoid.webp'),
              ],
              borderRadius: true,
              radius:Radius.circular(30),
              dotBgColor: Colors.transparent,
              dotIncreasedColor: kPrimaryColor,
              animationCurve: Curves.fastOutSlowIn,
              animationDuration:Duration(milliseconds: 800),
            ),
          ),
        ),
      ),
    );
  }
}


