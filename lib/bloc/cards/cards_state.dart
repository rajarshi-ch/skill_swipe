part of 'cards_cubit.dart';

class CardsState extends Equatable {
  final ScreenStatus status;
  final Exception? error;
  final List<CardModel> cards;
  final int currentIndex;
  const CardsState({
    required this.status,
    required this.cards,
    this.currentIndex = 0,
    this.error,
  });

  factory CardsState.initial() {
    return const CardsState(
      status: ScreenStatus.initial,
      cards: [],
      error: null,
      currentIndex: 0,
    );
  }

  bool get isTitleActive =>
      cards.isNotEmpty ? cards[currentIndex].showTitle : false;
  bool get isTextActive =>
      cards.isNotEmpty ? cards[currentIndex].showText : false;

  bool get isImagePresent => cards.isNotEmpty
      ? cards[currentIndex].imageOptions.selectedImage != null
      : false;

  CardModel? get currentCard =>
      cards.isNotEmpty && currentIndex >= 0 && currentIndex < cards.length
          ? cards[currentIndex]
          : null;
  @override
  List<Object?> get props => [status, cards, error, currentIndex];

  CardsState copyWith(
      {ScreenStatus? status,
      final List<CardModel>? cards,
      Exception? error,
      int? currentIndex}) {
    return CardsState(
      status: status ?? this.status,
      cards: cards ?? this.cards,
      error: error,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
