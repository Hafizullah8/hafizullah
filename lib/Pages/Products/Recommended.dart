import 'package:flutter/material.dart';
import 'package:mono_project/constant.dart';
import 'package:mono_project/models/recommendedmodle.dart';
import '../../database.dart';
import '../../variable.dart';
class RecommendedProduct extends StatefulWidget {
  @override
  State<RecommendedProduct> createState() => _RecommendedState();
}

class _RecommendedState extends State<RecommendedProduct> {
  @override
  Widget build(BuildContext context) {
    // now i create grid how column product want to show
    return GridView.builder(

      scrollDirection: Axis.horizontal,
      itemCount: productList.length,

      itemBuilder: (BuildContext context, int index){

        return RecentSingleProd(

          recent_signle_prod_name:productList[index]['name'],

          recent_signle_prod_image: productList[index]['image'],

          recent_signle_prod_price: productList[index]['price'],

          recent_signle_prod_brand: productList[index]['brand'],

          recent_signle_country:productList[index]['country'],
          recent_signle_id:productList[index]['id'],
          recent_signle_isLike:productList[index]['isLike'],

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

  int recent_signle_id;
  int recent_signle_isLike;


  RecentSingleProd({

                       required this.recent_signle_prod_name,

                       required this.recent_signle_prod_image,

                       required this.recent_signle_prod_price,

                       required this.recent_signle_prod_brand,

                       required this.recent_signle_country,
                       required this.recent_signle_id,
                       required this.recent_signle_isLike

  });

  @override
  _RecentSingleProdState createState() => _RecentSingleProdState();
}

class _RecentSingleProdState extends State<RecentSingleProd> {
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
            child:Image(image: AssetImage(widget.recent_signle_prod_image), fit: BoxFit.cover,
              ),
          ),
          Container(
            height:180,
            width: 240,
            color: kBGColor2,
            child: Column(
              children:[
                ListTile(
                  title:Text(widget.recent_signle_prod_name),
                  subtitle: Text('${widget.recent_signle_prod_price}\$'),
                  trailing: Container(
                    height: 30,
                    width: 30,
                    decoration:BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(

                      icon: Icon(widget.recent_signle_isLike==0?Icons.favorite:Icons.favorite_border_outlined,color:widget.recent_signle_isLike==1?Colors.red:inactiveColor,size: 15,),
                      onPressed: () {
                        setState((){
                          if(widget.recent_signle_isLike==0){
                            widget.recent_signle_isLike=1;
                            for(var producname in productListg){
                              if(RecommendedModle.fromMap(producname).getid()==widget.recent_signle_id){

                                databaseHandler.updateData(DatabaseHandler.tblrname,RecommendedModle.fromMap(producname).setisLike(1).toMap(),'id=?',producname);

                              }
                            }

                          }else{
                            widget.recent_signle_isLike=0;
                            for(var producname in productListg){
                              if(RecommendedModle.fromMap(producname).getid()==widget.recent_signle_id){
                                databaseHandler.updateData(DatabaseHandler.tblrname,RecommendedModle.fromMap(producname).setisLike(0).toMap(),'id=?',producname);
                              }
                            }
                          }
                        });
                      },),
                  ),),
                ListTile(
                  title: Text('Brand:   ${widget.recent_signle_prod_brand}'),
                  subtitle: Text('Country:  ${widget.recent_signle_country}'),
                ),
                Divider(),
              ],
            ),
          ),






        ],
      ),
    );
  }
}