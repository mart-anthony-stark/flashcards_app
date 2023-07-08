import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectionMenuController extends GetxController {
  void showContextMenu() {
    final items = <PopupMenuEntry<String>>[
      const PopupMenuItem<String>(
        value: 'item1',
        child: Text('Menu Item 1'),
      ),
      const PopupMenuItem<String>(
        value: 'item2',
        child: Text('Menu Item 2'),
      ),
      const PopupMenuItem<String>(
        value: 'item3',
        child: Text('Menu Item 3'),
      ),
    ];

    showMenu<String>(
      context: Get.overlayContext!,
      position:
          const RelativeRect.fromLTRB(0, 0, 0, 0), // Adjust position if needed
      items: items,
    ).then((value) {
      if (value != null) {
        // Handle menu item selection
        debugPrint(value);
      }
    });
  }
}
