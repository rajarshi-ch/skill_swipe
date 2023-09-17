import 'package:flutter/material.dart';
import 'package:skill_swipe/app/enums.dart';

class ImageOptions {
  final ImageAlignmentOption imageAlignment;
  final String? selectedImage;

  ImageOptions(
      {this.imageAlignment = ImageAlignmentOption.bottom, this.selectedImage});

  ImageOptions copyWith({
    ImageAlignmentOption? imageAlignment,
    String? selectedImage,
  }) {
    return ImageOptions(
      imageAlignment: imageAlignment ?? this.imageAlignment,
      selectedImage: selectedImage ?? this.selectedImage,
    );
  }
}
