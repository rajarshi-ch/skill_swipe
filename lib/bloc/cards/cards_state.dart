part of 'cards_cubit.dart';

class CardsState extends Equatable {
  final ScreenStatus status;
  final Exception? error;
  final List<CardModel> cards;
  const CardsState({
    required this.status,
    required this.cards,
    this.error,
  });

  factory CardsState.initial() {
    return const CardsState(
      status: ScreenStatus.initial,
      cards: [],
      error: null,
    );
  }

  @override
  List<Object?> get props => [
        status,
        cards,
        error,
      ];

  CardsState copyWith({
    ScreenStatus? status,
    final List<CardModel>? cards,
    Exception? error,
  }) {
    return CardsState(
      status: status ?? this.status,
      cards: cards ?? this.cards,
      error: error,
    );
  }
}
