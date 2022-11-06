
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
      child: Container(
        height: 200,
        child:Carousel(

          images:[
            AssetImage('asset/images/image1.jpg'),
            AssetImage('asset/images/image2.jpg'),
            AssetImage('asset/images/image3.jpg'),
            AssetImage('asset/images/image5.webp'),
          ],
          borderRadius: true,
          radius:Radius.circular(30),
          dotBgColor: Colors.transparent,
          dotIncreasedColor: kPrimaryColor,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration:Duration(milliseconds: 800),
        ),
      ),
    );
  }
}


