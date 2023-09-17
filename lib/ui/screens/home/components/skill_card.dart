import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:skill_swipe/app/enums.dart';
import 'package:skill_swipe/models/card_model.dart';
import 'package:skill_swipe/app/text_styles.dart';
import 'package:skill_swipe/ui/screens/home/components/drag_handler.dart';
import 'package:skill_swipe/ui/screens/home/components/rich_text_editor.dart';

class SkillCard extends StatefulWidget {
  const SkillCard({super.key, required this.card});
  final CardModel card;

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  double dividerPosition = 0.5;

  Widget TextComponent() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.card.showTitle)
            TextFormField(
              decoration: InputDecoration(
                hintText: "Title",
                border: InputBorder.none,
                hintStyle: kTitleHintTextStyle,
              ),
              style: kTitleTextStyle,
              minLines: 1,
              maxLines: 10,
              controller: widget.card.titleController,
            ),
          if (widget.card.showText)
            MyTextEditor(
              card: widget.card,
            ),
        ],
      ),
    );
  }

  Widget ImageComponent() {
    final imageAlignment = widget.card.imageOptions.imageAlignment;
    bool condition = false;
    if (imageAlignment == ImageAlignmentOption.top) {
      condition = dividerPosition < 0.35;
    } else if (imageAlignment == ImageAlignmentOption.bottom) {
      condition = dividerPosition > 0.65;
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: condition ? BoxFit.fitWidth : BoxFit.fitHeight,
          image: NetworkImage(widget.card.imageOptions.selectedImage!),
        ),
      ),
      // child: Image.network(
      //   "https://picsum.photos/300/200",
      //   fit: BoxFit.fitHeight,
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final imageAlignment = widget.card.imageOptions.imageAlignment;
    final currentImage = widget.card.imageOptions.selectedImage;
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF90CAF9), // Light Blue
              Color(0xFF9CCC65), // Light Green
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          image: widget.card.imageOptions.imageAlignment ==
                      ImageAlignmentOption.fullscreen &&
                  widget.card.imageOptions.selectedImage != null
              ? DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.card.imageOptions.selectedImage!),
                )
              : null,
          borderRadius:
              BorderRadius.circular(20.0), // Adjust the radius as needed
          border: Border.all(
            color: const Color.fromARGB(255, 210, 210, 210), // Border color
            width: 1.0, // Border width
          ),
        ),
        child: (currentImage == null ||
                imageAlignment == ImageAlignmentOption.fullscreen)
            ? Expanded(
                child: Container(
                  child: TextComponent(),
                ),
              )
            : Stack(
                children: [
                  Column(
                    children: <Widget>[
                      Expanded(
                        flex: (dividerPosition * 100).toInt(),
                        child: Container(
                          child: imageAlignment == ImageAlignmentOption.top
                              ? ImageComponent()
                              : TextComponent(),
                        ),
                      ),
                      Expanded(
                        flex: ((1 - dividerPosition) * 100).toInt(),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            imageAlignment == ImageAlignmentOption.bottom
                                ? ImageComponent()
                                : TextComponent(),
                            Positioned(
                              top: 0,
                              child: DragHandler(),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Expanded(
                        flex: (dividerPosition * 100).toInt(),
                        child: SizedBox(),
                      ),
                      GestureDetector(
                        onVerticalDragUpdate: (details) {
                          setState(() {
                            double newPosition = dividerPosition +
                                details.delta.dy / context.size!.height;
                            dividerPosition = newPosition.clamp(0.1,
                                0.9); // Adjust min and max position as needed
                          });
                        },
                        child: Container(
                          height: 30.0, // Height of the divider handler
                          color: Colors.transparent,
                          alignment: Alignment.center,
                        ),
                      ),
                      Expanded(
                          flex: ((1 - dividerPosition) * 100).toInt(),
                          child: SizedBox()),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
