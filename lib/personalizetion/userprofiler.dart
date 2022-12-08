import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:mono_project/constant.dart';
import 'package:mono_project/database.dart';
import 'package:mono_project/models/products.dart';
import 'package:mono_project/personalizetion/pricepicker.dart';
import 'package:mono_project/variable.dart';
import '../Pages/homescreeen.dart';
class UserProfiler extends StatefulWidget {

  @override
  State<UserProfiler> createState() => _UserProfilerState();
}
class _UserProfilerState extends State<UserProfiler> {
  //مربوط به بخش انتخاب مکان می باشد
  var _locations = ['Afghanistan', 'Iran'];
  String selectedLocation = 'Afghanistan';
  String choose='';

//  مربوط به بخش انتخاب محصولات می باشد
  List<String> text=[];
  bool _isChecked = false;
  String _currText = '';
  List<String> chooseProduct = ["smarthwatch", "shoes", "clothing","glasses"];



//مربوط به بخش انتخاب برند می باشد
  List<String> smart=["Sumsung","Apple"];
  List<String> shoes=["mart","adidas"];
  List<String> clothing=["leman","siawood"];
  List<String> glasses=["optic","rayban"];
  List<String> newtext=[];
  bool _isnewChecked=false;
  String _nowcurrText='';
 //از این واریبل ها در قسمت فیلترینگ استفاده میشود یعنی قیمت های بخود میگرد که ما انتخاب کردیم یا علایق ما میباشد
  String? n='';
  String? b='';
  String? g='';
  int? p=0;
  String? c='';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:kPrimaryColor,
      body: SingleChildScrollView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //مکان یا حوضه خرید انتخاب میکنیم
            Container(
              height: 100,
              margin:EdgeInsets.only(top: 40) ,
              child:Column(
                  children:[
                    Text("please choose a location"),
                    SizedBox(height: 15,),
                    DropdownButton<String>(
                      dropdownColor:kPrimaryColor,
                      isExpanded: true,
                      value: selectedLocation,
                      icon: const Icon(Icons.flag_circle_sharp,size: 40,),
                      iconSize: 20,
                      elevation: 16,
                      underline: Container(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedLocation = newValue!;
                          choose=selectedLocation;
                          if(choose!=''){
                            text=chooseProduct;
                          }else{
                            print("sorry");
                          };
                          c=selectedLocation;
                        });
                      },
                      items: List.generate(
                        _locations.length,
                            (index) => DropdownMenuItem(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                _locations[index]
                            ),
                          ),
                          value: _locations[index],
                        ),
                      ),

                    ),
                  ]
              ),

            ),
            Divider(color: Colors.grey, height: 32),
            //نوع محصول که انتخاب میکنیم
            Container(
              child: Column(
                children:[
                  Text("select your product"),
                  SizedBox(height: 15,),
                  Center(
                    child: Text(_currText,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                  ),

                  Container(
                    height: 350.0,
                    child: Column(
                      children: text
                          .map((t) => CheckboxListTile(
                        title: Text(t),
                        value: _isChecked,
                        onChanged: (val) {
                          setState(() {
                              val = _isChecked;
                              if (val == false) {
                                _currText = t;
                                n = _currText;
                                if (_currText == 'smarthwatch') {
                                  newtext = smart;
                                }
                                else if (_currText == "shoes") {
                                  newtext = shoes;
                                } else if (_currText == "clothing") {
                                  newtext = clothing;
                                }
                                else if (_currText == "glasses") {
                                  newtext = glasses;
                                }
                              }
                           });
                          },
                      ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey, height: 32),
            //نوع برند که انتخاب می شود
            Container(

              child: Column(
                children:[
                  Text("select your brand"),
                  SizedBox(height: 15,),
                  Center(
                    child: Text(_nowcurrText,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Container(
                    height:450,
                    child: Column(
                      children: newtext
                          .map((t) => CheckboxListTile(
                        title: Text(t),
                        value: _isnewChecked,
                        onChanged: (val) {
                          setState(() {
                            val= _isnewChecked ;
                            if (val == false) {
                              _nowcurrText = t;
                              b=_nowcurrText;
                              print(b);
                            }
                          });
                        },
                      ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey, height: 32),
            //جنسیتی که مشخص میکنیم یعنی مردانه باشه یا زنانه
            Container(
              child: Text(
                'Select Gender',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
            getWidget(false, false),
            Divider(color: Colors.grey, height: 32),
            //محدوده قیمت که مشخص میشود
            PricePicker(),
            Divider(color: Colors.grey, height: 32),
            Container(
              height: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  ElevatedButton(
                    onPressed:()async{
     // print(123);
     // int t= await databaseHandler.insertProducts(DatabaseHandler.tblpname,producList);
     // print(t);
       if(PricePicker.getprice()>=5){
         p=PricePicker.getprice();
       await databaseHandler.deletet();
    if(productListg.length==0 && productList.length==0){

    productListg=await databaseHandler.retrieveData(DatabaseHandler.tblpname);

    for(var producname in productListg){

    if(Product.fromMap(producname).getcountry()==c && Product.fromMap(producname).getname()==n

    && Product.fromMap(producname).getbrand()==b && Product.fromMap(producname).getgender()==g

        && Product.fromMap(producname).getprice()<=p && Product.fromMap(producname).getprice()>=5

    ){

    productList.add(producname);

    }

    }
    setState(()async{
      await databaseHandler.insertProducts(DatabaseHandler.tblrname, productList);
      PricePicker.setprice(0);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    });

    }


    }; }, child:Text("Ok"),),
                ],
              ),
            )
            // If you want to show 3rd optional g
          ],
        ),
      ),
    );

  }

  Widget getWidget(bool showOtherGender, bool alignVertical) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 40),
      alignment: Alignment.center,
      child: GenderPickerWithImage(
        showOtherGender: showOtherGender,
        verticalAlignedText: alignVertical,
        // to show what's selected on app opens, but by default it's Male
        selectedGender: Gender.Male,
        selectedGenderTextStyle: TextStyle(
            color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
        unSelectedGenderTextStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.normal),
        onChanged: (Gender? gender){
          g=gender.toString();
          print(gender);
        },
        //Alignment between icons
        equallyAligned: true,
        animationDuration: Duration(milliseconds: 300),
        isCircular: true,
        // default : true,
        opacityOfGradient: 0.4,
        padding: const EdgeInsets.all(3),
        size: 50, //default : 40
      ),
    );
  }

}







