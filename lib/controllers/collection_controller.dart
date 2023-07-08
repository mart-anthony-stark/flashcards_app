import 'package:flashcards_app/models/collection.dart';
import 'package:flashcards_app/services/sql_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectionController extends GetxController {
  var isLoading = true.obs;
  var collectionList = <CollectionModel>[].obs;
  SqlService collectionService = SqlService(table: "collections");

  @override
  void onInit() {
    fetchCollections();
    super.onInit();
  }

  void fetchCollections() async {
    try {
      isLoading(true);
      var collections = await collectionService.getAll<CollectionModel>();
      collectionList.assignAll(collections);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void createCollection(String title, String description) async {
    try {
      await collectionService
          .save({'title': title, "description": description});
      fetchCollections();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void deleteCollection(int id) async {
    try {
      await collectionService.deleteOne(id);
      fetchCollections();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
