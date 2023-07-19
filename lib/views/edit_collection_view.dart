import 'package:flashcards_app/common/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCollection extends StatelessWidget {
  const EditCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${Get.arguments["title"].toUpperCase()}'),
        backgroundColor: AppColor.PRIMARY,
      ),
      body: Column(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('${Get.arguments["description"]}')],
        )
      ]),
    );
  }
}
