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
        onPressed: () {},
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
}
