import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mono_project/batum_main/favorite_page.dart';
import 'package:mono_project/batum_main/shoppingcart.dart';
import 'package:mono_project/enam.dart';
import '../batum_main/userprofile.dart';
import 'homescreeen.dart';
import '../constant.dart';
class BatumNavBar extends StatelessWidget {
  final Color inactiveColor=Colors.blueGrey;
   final MenuState selectedMenu;
  const BatumNavBar({required this.selectedMenu });
  @override
  Widget build(BuildContext context) {
    return
       Padding(
         padding: const EdgeInsets.symmetric(vertical: 15),
         child: Container(
          decoration: BoxDecoration(
              color:kPrimaryColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
              boxShadow: [BoxShadow(
                offset: Offset(0,-4),
                blurRadius:10,
              )]
          ),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: IconButton(
                    icon:SvgPicture.asset('asset/images/ICON/imageicon1.svg',
                      color:MenuState.homescreen==selectedMenu? kPrimaryColor: inactiveColor,),
                    onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()),);
                  },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon:SvgPicture.asset('asset/images/ICON/imageicon2.svg'),
                    color:MenuState.favorite==selectedMenu? kPrimaryColor: inactiveColor,
                    onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Favorit()),);
                  },
                  ),
                ),
                Expanded(
                  child: IconButton(

                    icon:SvgPicture.asset('asset/images/ICON/imageicon3.svg'),
                    color: MenuState.profile==selectedMenu? kPrimaryColor:inactiveColor,
                    onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>UserPage()),);
                  },

                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon:SvgPicture.asset('asset/images/ICON/imageicon4.svg'),
                    color:MenuState.shoppingCart==selectedMenu? kPrimaryColor:inactiveColor,onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ShoppingCart()),);
                  },

                  ),
                ),
              ],
            ),
          ),
      ),
       );

  }
}