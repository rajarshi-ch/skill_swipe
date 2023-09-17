import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:skill_swipe/models/card_model.dart';

class MyTextEditor extends StatefulWidget {
  const MyTextEditor({super.key, required this.card, this.readOnly = false});
  final CardModel card;
  final bool readOnly;
  @override
  _MyTextEditorState createState() => _MyTextEditorState();
}

class _MyTextEditorState extends State<MyTextEditor> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        quill.QuillEditor(
            controller: widget.card.textController,
            readOnly: widget.readOnly,
            focusNode: FocusNode(),
            scrollController: ScrollController(),
            scrollable: true,
            expands: false,
            padding: EdgeInsets.zero,
            autoFocus: false,
            placeholder: "Text",
            // textSelectionControls:
            //     CustomTextSelectionControls(controller: _controller),
            contextMenuBuilder: (context, rawEditorState) => SizedBox()
            // true for view only mode
            ),
      ],
    );
  }
}
