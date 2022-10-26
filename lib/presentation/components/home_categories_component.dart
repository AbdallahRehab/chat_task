import 'package:flutter/material.dart';

import '../../core/global/global_widget/global_widget.dart';
import '../../domain/entities/categories/categories_data_data.dart';

Widget buildCategoriesItems(
    BuildContext context, CategoriesDataData? categoriesModel) {
  return InkWell(
    onTap: () {
      print('qqq');
      BottomSheet(context, categoriesModel);
    },
    child: Card(
      elevation: 30.0,
      shadowColor: Colors.grey.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9.0),
        // side: BorderSide(width: 0.1,color: Colors.black.withOpacity(.9),)
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          buildCachedNetworkImage(
            imageUrl: categoriesModel!.image!,
            width: 110,
            height: 100,
          ),
          Container(
            color: Colors.black.withOpacity(0.6),
            width: 110,
            child: Text(
              '${categoriesModel.name}',
              maxLines: 1,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12.0,
                overflow: TextOverflow.ellipsis,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Future<void> BottomSheet(
    BuildContext context, CategoriesDataData? categoriesModel) async {
  return await showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: SizedBox(
          height: 500,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                // GoTo.screen(
                                //     context,
                                //     SellerScreen(
                                //         storeID: video.store!.seller_id!));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(categoriesModel!.image!,
                                    height: 44, width: 44),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),

                            // Product Details
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Store name
                                InkWell(
                                  onTap: () {
                                    // GoTo.screen(
                                    //     context,
                                    //     SellerScreen(
                                    //         storeID:
                                    //             video.store!.seller_id!));
                                  },
                                  child: Container(
                                    constraints: BoxConstraints(maxWidth: 120),
                                    child: Text(
                                      categoriesModel.name!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: 10),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      );
    },
  );
}
