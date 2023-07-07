import 'package:flashcards_app/common/app_color.dart';
import 'package:flashcards_app/controllers/collection_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectionsCard extends StatelessWidget {
  const CollectionsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CollectionController collectionController =
        Get.put(CollectionController());
    return SizedBox(
      height: 200, // Set a fixed height for the horizontal ListView
      child: ListView.builder(
        scrollDirection:
            Axis.horizontal, // Set the scroll direction to horizontal
        itemCount: collectionController.collectionList.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 300,
            child: Card(
              elevation: 10,
              color: AppColor.SECONDARY,
              margin: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  debugPrint(collectionController.collectionList[index].title);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            collectionController.collectionList[index].title,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.menu,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        collectionController.collectionList[index].description,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 201, 201, 201),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
