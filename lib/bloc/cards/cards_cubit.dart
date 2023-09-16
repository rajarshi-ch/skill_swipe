import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_swipe/app/enums.dart';
import 'package:skill_swipe/models/card_model.dart';

part 'cards_state.dart';

class CardsCubit extends Cubit<CardsState> {
  CardsCubit() : super(CardsState.initial());
}
