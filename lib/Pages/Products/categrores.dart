import 'package:flutter/material.dart';
import 'package:mono_project/constant.dart';
import 'package:mono_project/variable.dart';
class Categores extends StatefulWidget {
  @override
  State<Categores> createState() => _CategoresState();
}
class _CategoresState extends State<Categores> {
  @override
  Widget build(BuildContext context) {
    // now i create grid how column product want to show
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: productListg.length,
      itemBuilder: (BuildContext context, int index){
        return RecentSingleProd(
          recent_signle_prod_name:productListg[index]['name'],
          recent_signle_prod_image: productListg[index]['image'],
          recent_signle_prod_price: productListg[index]['price'],
          recent_signle_prod_brand: productListg[index]['brand'],
          recent_signle_country:productListg[index]['country'],
        );
      }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:1,childAspectRatio: 1),
    );
  }
}

class RecentSingleProd extends StatefulWidget {
  final  recent_signle_prod_name;
  final  recent_signle_prod_image;
  int recent_signle_prod_price;
  final recent_signle_prod_brand;
  final recent_signle_country;
  RecentSingleProd({
    required this.recent_signle_prod_name,
    required this.recent_signle_prod_image,
    required this.recent_signle_prod_price,
    required this.recent_signle_prod_brand,
    required this.recent_signle_country

  });

  @override
  _RecentSingleProdState createState() => _RecentSingleProdState();
}

class _RecentSingleProdState extends State<RecentSingleProd> {
  bool isLike=false;
  final Color inactiveColor=Colors.red;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height:180,
            width: 240,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kPrimaryColor,
            ),
            child:
            Image(
              image: AssetImage(widget.recent_signle_prod_image),
              fit: BoxFit.cover,
            ),

          ),
          ListTile(
            title:Text(widget.recent_signle_prod_name),
            subtitle: Text('${widget.recent_signle_prod_price}\$'),
            trailing: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                icon: Icon(isLike?Icons.favorite:Icons.favorite_border_outlined,color:isLike?Colors.red:inactiveColor,size: 15,),
                onPressed: () {
                  setState((){
                    isLike=!isLike;
                  });
                },),
            ),),
          ListTile(
            title: Text('Brand:   ${widget.recent_signle_prod_brand}'),
            subtitle: Text('Country:  ${widget.recent_signle_country}'),
          ),


        ],
      ),
    );
  }
}