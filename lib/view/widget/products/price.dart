import 'package:flutter/material.dart';

class custumPrice extends StatelessWidget {
  final void Function() onPressedAdd;
    final void Function() onPressedRemove;
    final String count; 
final String price; 

  const custumPrice({super.key, required this.onPressedAdd, required this.onPressedRemove, required this.price, required this.count});

  @override
  Widget build(BuildContext context) {
    return    Row(
                        
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: onPressedAdd,
                                icon: Icon(Icons.add),
                              ),
                              Container(child: Text(count,style: TextStyle(fontSize: 20),)),
                              IconButton(
                                onPressed: onPressedRemove,
                                icon: Icon(Icons.remove),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                           "$price" ,
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                        ],
                      );
  }
}


//"${Controller.ItemsModel["items_Price"]}""\$"