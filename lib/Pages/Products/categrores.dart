import 'package:flutter/material.dart';
import 'package:mono_project/constant.dart';
import 'package:mono_project/database.dart';
import 'package:mono_project/models/products.dart';
import 'package:mono_project/models/recommendedmodle.dart';
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
          recent_signle_id:productListg[index]['id'],
          recent_signle_prod_name:productListg[index]['name'],
          recent_signle_prod_image: productListg[index]['image'],
          recent_signle_prod_price: productListg[index]['price'],
          recent_signle_prod_brand: productListg[index]['brand'],
          recent_signle_country:productListg[index]['country'],
          recent_signle_isLike: productListg[index]['isLike'],
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
    required this.recent_signle_id,
    required this.recent_signle_prod_name,
    required this.recent_signle_prod_image,
    required this.recent_signle_prod_price,
    required this.recent_signle_prod_brand,
    required this.recent_signle_country,
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
            child:
            Image(
              image: AssetImage(widget.recent_signle_prod_image),
              fit: BoxFit.cover,
            ),

          ),
          Container(
            height:180,
            width: 240,
            color: kBGColor2,
            child: Column(
              children: [
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

                      icon: Icon(widget.recent_signle_isLike==1?Icons.favorite:Icons.favorite_border_outlined,

                        color:widget.recent_signle_isLike==0?Colors.red:inactiveColor,size: 15,),

                      onPressed: () {

                        setState((){

                          if(this.widget.recent_signle_isLike==0){

                            productListg[this.widget.recent_signle_id]['isLike']=1;


                            for(var producname in productListg){

                              if(Product.fromMap(producname).getid()==widget.recent_signle_id){

                                databaseHandler.updateData(DatabaseHandler.tblpname,producname.setisLike(1),'id=?'
                                    ,Product.fromMap(producname).getid());

                              }
                            }
                          }else{

                            productListg[widget.recent_signle_id]['isLike']=0;

                            for(var producname in productListg){
                              
                              if(Product.fromMap(producname).getid()==widget.recent_signle_id){

                                databaseHandler.updateData(DatabaseHandler.tblpname,Product.fromMap(producname).setisLike(0).toMap(),'id=?',Product.fromMap(producname).getid().toMap());
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
              ],
            ),
          ),



        ],
      ),
    );
  }
}