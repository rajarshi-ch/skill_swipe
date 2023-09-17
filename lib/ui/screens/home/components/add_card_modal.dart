import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_swipe/bloc/cards/cards_cubit.dart';
import 'package:skill_swipe/ui/widgets/card_option_button.dart';

class AddCardModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CardsCubit>(context);
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
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          CardOptionButton(
            icon: Icons.subject,
            title: "Card",
            onTap: () {
              bloc.addCard();
              Navigator.of(context).pop();
            },
          ),
          SizedBox(
            height: 8,
          ),
          CardOptionButton(
            icon: Icons.videocam_outlined,
            title: "Video",
            onTap: () => {},
          ),
          SizedBox(
            height: 8,
          ),
          CardOptionButton(
            icon: Icons.format_list_numbered,
            title: "Poll",
            onTap: () => {},
          ),
          SizedBox(
            height: 8,
          ),
          CardOptionButton(
            icon: Icons.rule,
            title: "Quiz",
            onTap: () => {},
          ),
        ]),
      ),
    );
  }
}
