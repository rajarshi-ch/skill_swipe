import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_swipe/app/enums.dart';
import 'package:skill_swipe/models/card_model.dart';
import 'package:skill_swipe/models/image_options.dart';

part 'cards_state.dart';

class CardsCubit extends Cubit<CardsState> {
  CardsCubit() : super(CardsState.initial());

  void addCard() {
    emit(
      state.copyWith(
        cards: state.cards +
            [
              CardModel(
                cardType: CardType.card,
                imageOptions: ImageOptions(),
              )
            ],
      ),
    );
  }

  void addVideoCard(String videoId) {
    emit(state.copyWith(
      cards: state.cards +
          [
            CardModel(
              cardType: CardType.video,
              videoId: videoId,
              showText: false,
              showTitle: false,
            )
          ],
    ));
  }

  String generateNewRandomPictureUrl() {
    // Create an instance of the Random class
    final random = Random();

    // Generate a random number between 1 and 1000 (inclusive)
    int randomNumber = random.nextInt(1000) + 1;

    return "https://picsum.photos/id/${randomNumber}/300/200";
  }

  void nextCard() {
    if (state.currentIndex < state.cards.length - 1) {
      emit(state.copyWith(currentIndex: state.currentIndex + 1));
    }
  }

  void previousCard() {
    if (state.currentIndex > 0) {
      emit(state.copyWith(currentIndex: state.currentIndex - 1));
    }
  }

  void toggleTitle() {
    var newCard = state.cards[state.currentIndex]
        .copyWith(showTitle: !state.cards[state.currentIndex].showTitle);
    List<CardModel> newCards = [];
    newCards.addAll(state.cards);
    newCards[state.currentIndex] = newCard;
    emit(state.copyWith(cards: newCards));
  }

  void toggleText() {
    var newCard = state.cards[state.currentIndex]
        .copyWith(showText: !state.cards[state.currentIndex].showText);
    List<CardModel> newCards = [];
    newCards.addAll(state.cards);
    newCards[state.currentIndex] = newCard;
    emit(state.copyWith(cards: newCards));
  }

  void addRandomImage() {
    var newCard = state.cards[state.currentIndex].copyWith(
        imageOptions: state.cards[state.currentIndex].imageOptions
            .copyWith(selectedImage: generateNewRandomPictureUrl()));
    List<CardModel> newCards = [];
    newCards.addAll(state.cards);
    newCards[state.currentIndex] = newCard;
    emit(state.copyWith(cards: newCards));
  }

  void changeImageAlignment(ImageAlignmentOption newAlignment) {
    var newCard = state.cards[state.currentIndex].copyWith(
        imageOptions: state.cards[state.currentIndex].imageOptions
            .copyWith(imageAlignment: newAlignment));
    List<CardModel> newCards = [];
    newCards.addAll(state.cards);
    newCards[state.currentIndex] = newCard;
    emit(state.copyWith(cards: newCards));
  }
}
