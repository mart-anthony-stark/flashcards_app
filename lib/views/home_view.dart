import 'package:flashcards_app/common/app_color.dart';
import 'package:flashcards_app/common/app_string.dart';
import 'package:flashcards_app/models/collection.dart';
import 'package:flashcards_app/services/sql_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SqlService collectionsService = SqlService(table: 'collections');

  void getCollections() async {
    List<CollectionModel> collections =
        await collectionsService.getAll<CollectionModel>();
  }

  void createCollection() async {
    await collectionsService.save({'title': "title1", 'description': "desc"});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.TITLE),
        backgroundColor: AppColor.PRIMARY,
      ),
      body: Center(
        child: Column(children: [
          ElevatedButton(
              onPressed: getCollections, child: const Text('Get Collections'))
        ]),
      ),
    );
  }
}
