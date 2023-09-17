import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_swipe/app/enums.dart';
import 'package:skill_swipe/bloc/cards/cards_cubit.dart';
import 'package:skill_swipe/ui/widgets/card_option_button.dart';

class ImageOptionsModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CardsCubit>(context);
    final imageOption = bloc.state.cards[bloc.state.currentIndex].imageOptions;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0.0,
      insetPadding: EdgeInsets.symmetric(horizontal: 100),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: imageOption.selectedImage == null
                ? [
                    CardOptionButton(
                      icon: Icons.image,
                      title: "Add Random",
                      onTap: () {
                        bloc.addRandomImage();
                        Navigator.of(context).pop();
                      },
                    ),
                  ]
                : [
                    CardOptionButton(
                      icon: Icons.image,
                      title: "Change Random",
                      onTap: () {
                        bloc.addRandomImage();
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CardOptionButton(
                      icon: Icons.vertical_align_top,
                      title: "Align Top",
                      onTap: () {
                        bloc.changeImageAlignment(ImageAlignmentOption.top);
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CardOptionButton(
                      icon: Icons.vertical_align_bottom,
                      title: "Align Bottom",
                      onTap: () {
                        bloc.changeImageAlignment(ImageAlignmentOption.bottom);
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CardOptionButton(
                      icon: Icons.fullscreen_sharp,
                      title: "Fullscreen",
                      onTap: () {
                        bloc.changeImageAlignment(
                            ImageAlignmentOption.fullscreen);
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CardOptionButton(
                      icon: Icons.cancel,
                      title: "Delete",
                      onTap: () => {},
                      color: Colors.red,
                    ),
                  ]),
      ),
    );
  }
}
