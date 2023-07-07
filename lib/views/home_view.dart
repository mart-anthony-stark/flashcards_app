import 'package:flashcards_app/common/app_color.dart';
import 'package:flashcards_app/common/app_string.dart';
import 'package:flashcards_app/controllers/collection_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final CollectionController collectionController =
      Get.put(CollectionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.TITLE),
        backgroundColor: AppColor.PRIMARY,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showBottomSheet,
        backgroundColor: AppColor.PRIMARY,
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Obx(() {
        if (collectionController.isLoading.value) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColor.PRIMARY,
          ));
        } else {
          return ListView.builder(
              itemCount: collectionController.collectionList.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 10,
                  color: AppColor.SECONDARY,
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          collectionController.collectionList[index].title,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          collectionController
                              .collectionList[index].description,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                );
              });
        }
      }),
    );
  }

  void showBottomSheet() {
    Get.bottomSheet(Container(
      height: 400,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: <Widget>[
          const Center(
              child: Text(
            "Add Collection",
            style:
                TextStyle(color: AppColor.PRIMARY, fontWeight: FontWeight.bold),
          )),
          const TextField(
            decoration: InputDecoration(hintText: "Title"),
          ),
          const TextField(
            decoration: InputDecoration(hintText: "Description"),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(AppColor.PRIMARY)),
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Get.back(closeOverlays: true);
                  },
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(AppColor.SECONDARY)),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    ));
  }
}
