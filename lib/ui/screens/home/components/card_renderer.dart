import 'package:flutter/widgets.dart';
import 'package:skill_swipe/app/enums.dart';
import 'package:skill_swipe/models/card_model.dart';
import 'package:skill_swipe/ui/screens/home/components/skill_card.dart';
import 'package:skill_swipe/ui/screens/home/components/video_card.dart';

class CardRenderer extends StatelessWidget {
  const CardRenderer({super.key, required this.card});
  final CardModel card;
  @override
  Widget build(BuildContext context) {
    if (card.cardType == CardType.card) {
      return SkillCard(card: card);
    } else if (card.cardType == CardType.video) {
      return VideoCard(card: card);
    }

    return SizedBox();
  }
}
