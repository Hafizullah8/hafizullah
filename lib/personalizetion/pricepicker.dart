import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class PricePicker extends StatefulWidget {
  @override
  _PricePickerState createState() => _PricePickerState();
  static int _currentHorizontalIntValue = 4;
  static getprice() {

    return _currentHorizontalIntValue;

  }

  static void setprice(int price){
    _currentHorizontalIntValue=price;
  }

}
class _PricePickerState extends State<PricePicker> {



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        SizedBox(height: 16),
        Text('Select  Bounded Price', style: Theme.of(context).textTheme.headline6),
        NumberPicker(
          value: PricePicker. _currentHorizontalIntValue,
          minValue: 0,
          maxValue: 5000,
          step: 10,
          itemHeight: 100,
          axis: Axis.horizontal,
          onChanged: (value) =>
              setState((){
                PricePicker. _currentHorizontalIntValue = value;
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
                final newValue = PricePicker._currentHorizontalIntValue - 10;
                PricePicker. _currentHorizontalIntValue = newValue.clamp(5, 5000);
              }),
            ),

            Text('bounded value: ${PricePicker._currentHorizontalIntValue}'),

            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => setState(() {
                final newValue = PricePicker._currentHorizontalIntValue + 10;
                PricePicker._currentHorizontalIntValue = newValue.clamp(5,5000);
              }),
            ),


          ],
        ),
      ],
    );
  }

}