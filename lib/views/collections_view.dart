import 'package:flashcards_app/common/app_color.dart';
import 'package:flashcards_app/controllers/collection_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectionsCard extends StatelessWidget {
  CollectionsCard({Key? key}) : super(key: key);

  final CollectionController collectionController =
      Get.put(CollectionController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
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
                onLongPress: () {
                  showEditCollectionSheet(
                      collectionController.collectionList[index].id);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              collectionController.collectionList[index].title,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        collectionController.collectionList[index].description,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 201, 201, 201),
                          fontSize: 15,
                        ),
                      ),
                      const Expanded(child: SizedBox(height: 10)),
                      // CTA Start Buttons
                      Row(
                        children: [
                          ElevatedButton.icon(
                              onPressed: () {},
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.white),
                                  iconColor: MaterialStatePropertyAll(
                                      AppColor.PRIMARY)),
                              icon: const Icon(Icons.explore),
                              label: const Text(
                                "Explore",
                                style: TextStyle(color: AppColor.PRIMARY),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ElevatedButton.icon(
                                onPressed: () {},
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        AppColor.PRIMARY)),
                                icon: const Icon(Icons.assignment),
                                label: const Text("Quiz")),
                          ),
                        ],
                      )
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

  void showEditCollectionSheet(int id) {
    Get.bottomSheet(Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Wrap(children: [
        ListTile(
          leading: const Icon(Icons.edit_outlined, color: Colors.green),
          title: const Text('Edit', style: TextStyle(color: AppColor.PRIMARY)),
          onTap: () {
            var collection = collectionController.collectionList
                .where((c) => c.id == id)
                .toList();
            if (collection.isNotEmpty) {
              Get.toNamed("/edit-collection", arguments: {
                'id': id,
                'title': collection[0].title,
                'description': collection[0].description
              });
            }
            // Get.back(closeOverlays: true);
          },
        ),
        ListTile(
          leading: const Icon(Icons.delete_outline, color: Colors.red),
          title:
              const Text('Delete', style: TextStyle(color: AppColor.PRIMARY)),
          onTap: () {
            collectionController.deleteCollection(id);
            Get.back(closeOverlays: true);
          },
        ),
      ]),
    ));
  }
}
