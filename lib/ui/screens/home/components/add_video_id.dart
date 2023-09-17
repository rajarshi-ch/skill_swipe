import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_swipe/bloc/cards/cards_cubit.dart';

class AddYoutubeVideoModal extends StatefulWidget {
  @override
  _AddYoutubeVideoModalState createState() => _AddYoutubeVideoModalState();
}

class _AddYoutubeVideoModalState extends State<AddYoutubeVideoModal> {
  final TextEditingController _videoIdController =
      TextEditingController(text: "Fo7XPf9j9lo");

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add YouTube Video ID'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: _videoIdController,
            decoration: InputDecoration(
              hintText: 'Enter YouTube Video ID',
            ),
          ),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            // Add logic to handle the "ADD" button action here
            final videoId = _videoIdController.text;
            // Perform any actions you need with the video ID
            BlocProvider.of<CardsCubit>(context).addVideoCard(videoId);
            Navigator.of(context).pop(); // Close the modal
            Navigator.of(context).pop();
          },
          child: Text('ADD'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _videoIdController.dispose();
    super.dispose();
  }
}

void showAddYoutubeVideoModal(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AddYoutubeVideoModal();
    },
  );
}
