import 'package:flashcards_app/models/flashcard.dart';
import 'package:flashcards_app/services/sql_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardsController extends GetxController {
  var isLoading = true.obs;
  var cardsList = <FlashcardModel>[].obs;
  SqlService cardsService = SqlService(table: "cards");

  void fetchCards(int collectionId) async {
    try {
      isLoading(true);
      var cards = await cardsService
          .getAll<FlashcardModel>(where: {'collection_id': collectionId});
      cardsList.assignAll(cards);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void createCard(int collectionId, String question, String answer) async {
    try {
      await cardsService.save({'question': question, 'answer': answer});
      fetchCards(collectionId);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
