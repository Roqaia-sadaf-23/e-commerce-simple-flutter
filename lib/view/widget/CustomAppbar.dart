import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final String titalappbar;
 // final void Function() onPressedIconnotifications;
  final void Function() onPressedsreach;
  final void Function() onPressedIconfavorite;
  final void Function(String)? onChanged;
  final TextEditingController? mycotroller;
  const CustomAppbar({
    super.key,
    required this.titalappbar,
   // required this.onPressedIconnotifications,
    required this.onPressedsreach,
    required this.onPressedIconfavorite, this.onChanged, required this.mycotroller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: mycotroller,
              onChanged: onChanged,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(25),
                ),
                prefixIcon: IconButton(
                  onPressed: onPressedsreach,
                  icon: Icon(Icons.search_outlined),
                ),
                hintText: titalappbar,
                hintStyle: TextStyle(fontSize: 18),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          /* Container(
            width: 60,

            child: IconButton(
              onPressed: onPressedIconnotifications,
              icon: Icon(
                Icons.notifications_active_outlined,
                size: 35,
                color: Colors.grey,
              ),
            ),
          ), */
          Container(
            width: 60,

            child: IconButton(
              onPressed: onPressedIconfavorite,
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 35,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
