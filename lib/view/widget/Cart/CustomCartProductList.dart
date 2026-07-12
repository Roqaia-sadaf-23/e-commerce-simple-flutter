import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:testproject/core/constant/Applinkapi.dart';
import 'package:testproject/core/constant/colors.dart';

class Customcartproductlist extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imagename;
  final Function() onAdd;
    final Function() onRemode;
  const Customcartproductlist({
    super.key,
    required this.name,
    required this.price,
    required this.count,
    required this.imagename, required this.onAdd, required this.onRemode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

     // height:260,
     // width: 220,
      child: Column(
       // mainAxisSize: MainAxisSize.min,
        children: [
         /*  Container(child: Row(children: [Expanded(child: TextFormField() ),
          Custumbottuncart(textbutton: "Apply", onPressed: () {},
          
          ),
         ],),), */
          Card(
            child: Container(
             
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CachedNetworkImage(
                      imageUrl: "${Applinkapi.getimageStatic}/${imagename}",
                    height: 70,),
                  ),
                  Expanded(
                    flex: 4,
                    child: ListTile(
                      title: Text("$name"),
                      subtitle: Text(
                        "${price}\$",
                        style: TextStyle(color: Appcolor.Red),
                      ),
                    ),
                  ),
               Column(
                      children: [
                        IconButton(onPressed:onAdd, icon: Icon(Icons.add_outlined)),
          
                        Container(child: Text(count)),
                        IconButton(onPressed: onRemode, icon: Icon(Icons.remove)),
                      ],
                    ),
               
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
