import 'package:flutter/material.dart';
import 'package:skill_swipe/models/card_model.dart';
import 'package:skill_swipe/ui/common/text_styles.dart';
import 'package:skill_swipe/ui/screens/home/components/rich_text_editor.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({super.key, required this.card});
  final CardModel card;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF90CAF9), // Light Blue
              Color(0xFF9CCC65), // Light Green
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius:
              BorderRadius.circular(20.0), // Adjust the radius as needed
          border: Border.all(
            color: const Color.fromARGB(255, 210, 210, 210), // Border color
            width: 1.0, // Border width
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Title",
                  border: InputBorder.none,
                  hintStyle: kTitleHintTextStyle,
                ),
                style: kTitleTextStyle,
                minLines: 1,
                maxLines: 10,
                controller: card.titleController,
              ),
              MyTextEditor(
                card: card,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
