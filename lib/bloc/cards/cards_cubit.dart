import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_swipe/app/enums.dart';
import 'package:skill_swipe/models/card_model.dart';

part 'cards_state.dart';

class CardsCubit extends Cubit<CardsState> {
  CardsCubit() : super(CardsState.initial());

  void addCard() {
    emit(state.copyWith(
        cards: state.cards + [CardModel(cardType: CardType.card)]));
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
}
