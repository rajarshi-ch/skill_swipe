import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:skill_swipe/app/enums.dart';
import 'package:skill_swipe/models/image_options.dart';

class CardModel {
  late TextEditingController titleController;
  late QuillController textController;
  final bool showTitle;
  final bool showText;
  late ImageOptions imageOptions;
  final CardType cardType;

  CardModel(
      {this.showTitle = true,
      this.showText = true,
      TextEditingController? titleController,
      QuillController? textController,
      ImageOptions? imageOptions,
      required this.cardType}) {
    this.titleController = titleController ?? TextEditingController();
    this.textController = textController ?? QuillController.basic();
    this.imageOptions = imageOptions ?? ImageOptions();
  }

  CardModel copyWith({
    TextEditingController? titleController,
    QuillController? textController,
    bool? showTitle,
    bool? showText,
    ImageOptions? imageOptions,
    CardType? cardType,
  }) {
    return CardModel(
      titleController: titleController ?? this.titleController,
      textController: textController ?? this.textController,
      showTitle: showTitle ?? this.showTitle,
      showText: showText ?? this.showText,
      imageOptions: imageOptions ?? this.imageOptions,
      cardType: cardType ?? this.cardType,
    );
  }
}
