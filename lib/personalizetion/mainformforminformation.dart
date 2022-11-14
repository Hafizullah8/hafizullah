import 'package:animated_button/animated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:mono_project/constant.dart';
import 'package:mono_project/database.dart';
import 'package:mono_project/models/products.dart';
import 'package:mono_project/variable.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:sqflite/utils/utils.dart';
import '../Pages/homescreeen.dart';
class MainforminformationC extends StatefulWidget {

  @override
  State<MainforminformationC> createState() => _MainforminformationCState();
}
class _MainforminformationCState extends State<MainforminformationC> {

  var _locations = ['Afghanistan', 'Iran'];
  String selectedLocation = 'Afghanistan';
  String choose='';

  List<String> text=[];
  bool _isChecked = false;
  bool _isnewChecked=false;
  String _nowcurrText='';
  String _currText = '';
  List<String> newtext=[];
  List<String> chooseproduce = ["smarthwatch", "shoes", "clothing","glasses"];
  List<String> smart=["Sumsung","Apple"];
  List<String> shoes=["mart","adidas"];
  List<String> clothing=["leman","siawood"];
  List<String> glasses=["optic","rayban"];


  late Product _product;
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
                            text=chooseproduce;
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
                        )),
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
            Container(
              child: Text(
                'Select Gender',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),

              getWidget(false, false),
            Divider(color: Colors.grey, height: 32),
            _IntegerExample(),
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
       if(_IntegerExample.getprice()>=5){
         p=_IntegerExample.getprice();
    List l=[];
    if(l.length==0){
    l=await databaseHandler.retrieveData(DatabaseHandler.tblpname);
    productListg.addAll(l);
    }
    if(productList.length!=0){
    productList.clear();
    for(var producname in l){
    if(Product.fromMap(producname).getcountry()==c && Product.fromMap(producname).getname()==n
    && Product.fromMap(producname).getbrand()==b && Product.fromMap(producname).getgender()==g
        && Product.fromMap(producname).getprice()<=p && Product.fromMap(producname).getprice()>=5
    ){
    productList.add(producname);
    }
    }
    setState(() {
      _IntegerExample.setprice(0);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    });
    }else{
    for(var producname in l){
    if(Product.fromMap(producname).getcountry()==c && Product.fromMap(producname).getname()==n
    && Product.fromMap(producname).getbrand()==b && Product.fromMap(producname).getgender()==g
        && Product.fromMap(producname).getprice()<=p && Product.fromMap(producname).getprice()>=5
    ){
    productList.add(producname);
    }
    }
    setState(() {
      _IntegerExample.setprice(0);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    });
    }

    }; }, child:Text("Send"),),
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
        onChanged: (Gender? gender) {
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
//   insertlist(){
//
//     for(int i=0;i<producList.length;i++){
//       for(int j=0;j<=5;j++){
//         if(producList[i][0]==producList[i][j]){
//           n=producList[i][j];
//         }else if(producList[i][1]==producList[i][j]){
//           b=producList[i][j];
//         }else if(producList[i][2]==producList[i][j]){
//           im=producList[i][j];
//         }else if(producList[i][3]==producList[i][j]){
//           g=producList[i][j];
//         }else if(producList[i][4]==producList[i][j]){
//           p=producList[i][j];
//         }else if(producList[i][5]==producList[i][j]){
//           c=producList[i][j];
//         }
//       }
//      return _product= Product( n!, b!, im!,  g!,  p!, c!);
//     }
//   }
}




class _IntegerExample extends StatefulWidget {
  @override
  __IntegerExampleState createState() => __IntegerExampleState();
  static int _currentHorizontalIntValue = 5;
  static getprice() {

    return _currentHorizontalIntValue;

  }

  static void setprice(int price){
    _currentHorizontalIntValue=price;
  }

}
class __IntegerExampleState extends State<_IntegerExample> {



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        SizedBox(height: 16),
        Text('Select  Bounded Price', style: Theme.of(context).textTheme.headline6),
        NumberPicker(
          value: _IntegerExample. _currentHorizontalIntValue,
          minValue: 0,
          maxValue: 5000,
          step: 10,
          itemHeight: 100,
          axis: Axis.horizontal,
          onChanged: (value) =>
              setState((){
                _IntegerExample. _currentHorizontalIntValue = value;
              }),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black26),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(icon: Icon(Icons.remove),
              onPressed: () => setState(() {
                final newValue = _IntegerExample._currentHorizontalIntValue - 10;
                _IntegerExample. _currentHorizontalIntValue = newValue.clamp(5, 5000);
              }),
            ),

            Text('bounded value: ${_IntegerExample._currentHorizontalIntValue}'),

            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => setState(() {
                final newValue = _IntegerExample._currentHorizontalIntValue + 10;
                _IntegerExample._currentHorizontalIntValue = newValue.clamp(5,5000);
              }),
            ),


          ],
        ),
      ],
    );
  }

}


