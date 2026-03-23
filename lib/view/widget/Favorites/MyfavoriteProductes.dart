import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/controller/Favorite_controller.dart';
import 'package:testproject/core/constant/Applinkapi.dart';
import 'package:testproject/data/model/FavoriteModele.dart';

class CustumeMyfavoriteProductes extends StatelessWidget {
  final MyFavoriteModele favoriteModele;
  const CustumeMyfavoriteProductes({super.key, required this.favoriteModele});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FavoriteControllerim>();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl:
                  "${Applinkapi.getimageStatic}/${favoriteModele.itemsImagePath ?? ""}",
              height: 100,
              width: 150,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(height: 5),
            Text(
              favoriteModele.itemsName ?? '',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              favoriteModele.itemsDesc ?? '',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${favoriteModele.itemsPrice ?? 0}\$",
                  style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.DeleteFavoriteByID(favoriteModele.favoriteID!);
                  },
                  icon: const Icon(
                    Icons.delete_outline_outlined,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
