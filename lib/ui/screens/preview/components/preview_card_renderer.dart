import 'package:flutter/widgets.dart';
import 'package:skill_swipe/app/enums.dart';
import 'package:skill_swipe/models/card_model.dart';
import 'package:skill_swipe/ui/screens/preview/components/preview_skill_card.dart';
import 'package:skill_swipe/ui/screens/preview/components/preview_video_card.dart';

class PreviewCardRenderer extends StatelessWidget {
  const PreviewCardRenderer({super.key, required this.card});
  final CardModel card;
  @override
  Widget build(BuildContext context) {
    if (card.cardType == CardType.card) {
      return PreviewSkillCard(card: card);
    } else if (card.cardType == CardType.video) {
      return PreviewVideoCard(card: card);
    }

    return SizedBox();
  }
}
