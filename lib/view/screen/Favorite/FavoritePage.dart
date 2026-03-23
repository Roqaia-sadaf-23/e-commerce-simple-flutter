import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/controller/Favorite_controller.dart';
import 'package:testproject/view/widget/Favorites/MyfavoriteProductes.dart';

import '../../../core/class/StatusRecuest.dart';

class Favoritepage extends StatelessWidget {
  const Favoritepage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoriteControllerim());

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Favorites"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Obx(() {
          // عرض حالة التحميل
          if (controller.statusRecuest.value == StatusRecuest.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          // إذا لا توجد بيانات
          if (controller.data.isEmpty) {
            return const Center(child: Text("No favorites yet"));
          }

          // عرض GridView للمنتجات
          return GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              return CustumeMyfavoriteProductes(
                favoriteModele: controller.data[index],
              );
            },
          );
        }),
      ),
    );
  }
}



//*********************************************************** */
/* 
class Favoritepage extends StatelessWidget {
  const Favoritepage({super.key});

  @override
  Widget build(BuildContext context) {
Get.put(FavoriteControllerim());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: GetBuilder<FavoriteControllerim>(
          builder:
              (controller) => Container(
                child: ListView(
                  children: [
                    /*    CustomAppbar(
                      titalappbar: "Find Product",
                      // onPressedIconnotifications: () {},
                      onPressedsreach: () {},
                      onPressedIconfavorite: () {
                        controller.GotoFavoritePage();
                      },
                    ), */
                    SizedBox(height: 20),
                    Handlingdataview(
                      statusRecuest: controller.statusRecuest,
                      widget: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) {
                          return CustumeMyfavoriteProductes(
                            favoriteModele: controller.data[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
 */