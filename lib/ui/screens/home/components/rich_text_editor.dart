import 'package:flutter/material.dart';

import 'package:flutter_quill/flutter_quill.dart' as quill;

class MyTextEditor extends StatefulWidget {
  @override
  _MyTextEditorState createState() => _MyTextEditorState();
}

class _MyTextEditorState extends State<MyTextEditor> {
  quill.QuillController _controller = quill.QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            child: quill.QuillEditor(
                controller: _controller,
                readOnly: false,
                focusNode: FocusNode(),
                scrollController: ScrollController(),
                scrollable: true,
                expands: false,
                padding: EdgeInsets.zero,
                autoFocus: false,
                // textSelectionControls:
                //     CustomTextSelectionControls(controller: _controller),
                contextMenuBuilder: (context, rawEditorState) => Stack(
                      children: [
                        Positioned(
                          top: rawEditorState
                              .contextMenuAnchors.primaryAnchor.dy,
                          left: rawEditorState
                              .contextMenuAnchors.primaryAnchor.dx,
                          child: Container(
                              height: 50,
                              child: Row(
                                children: [
                                  quill.ToggleStyleButton(
                                    attribute: quill.Attribute.bold,
                                    icon: Icons.format_bold,
                                    iconSize: 18,
                                    controller: _controller,
                                  ),
                                  quill.ToggleStyleButton(
                                    attribute: quill.Attribute.italic,
                                    icon: Icons.format_italic,
                                    iconSize: 18,
                                    controller: _controller,
                                  ),
                                ],
                              )),
                        ),
                      ],
                    )
                // true for view only mode
                ),
          ),
        ),
      ],
    );
  }
}

class CustomTextSelectionControls extends MaterialTextSelectionControls {
  final quill.QuillController _controller;

  CustomTextSelectionControls({required quill.QuillController controller})
      : _controller = controller;
  @override
  Widget buildHandle(
      BuildContext context, TextSelectionHandleType type, double textLineHeight,
      [VoidCallback? onTap]) {
    return Material(
      child: quill.QuillToolbar.basic(
        controller: _controller,
        multiRowsDisplay: false, // Set to false
        showDividers: false, // Set to false
        showFontFamily: false, // Set to false
        showFontSize: false, // Set to false
        showBoldButton: true,
        showItalicButton: true,
        showSmallButton: false,
        showUnderLineButton: false, // Set to false
        showStrikeThrough: false, // Set to false
        showInlineCode: false, // Set to false
        showColorButton: false, // Set to false
        showBackgroundColorButton: false, // Set to false
        showClearFormat: false, // Set to false
        showAlignmentButtons: false, // Set to false
        showLeftAlignment: false, // Set to false
        showCenterAlignment: false, // Set to false
        showRightAlignment: false, // Set to false
        showJustifyAlignment: false, // Set to false
        showHeaderStyle: false, // Set to false
        showListNumbers: false, // Set to false
        showListBullets: false, // Set to false
        showListCheck: false, // Set to false
        showCodeBlock: false, // Set to false
        showQuote: false, // Set to false
        showIndent: false, // Set to false
        showLink: false, // Set to false
        showUndo: false, // Set to false
        showRedo: false, // Set to false
        showDirection: false, // Set to false
        showSearchButton: false, // Set to false
        showSubscript: false, // Set to false
        showSuperscript: false, // Set to false
      ),
    );
  }
}
