import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'phrase.dart';
import 'text_anchor_parser.dart';

/// A paragraph for texts including simple links (http://...) or markdown format links ((Some text)[http://...]).
/// This widget is build to identify links present in the paragraph.
///
/// The format supported currently are as follows:
/// 1. http://this.is.a.link.com
/// 2. https://this.is.a.link.com/id?iuyt2uhj2
/// 3. (Youtube)[https://youtube.com/mychannel]
/// 4. (This is post) [http://linktosomepost.com/mypost]
///
/// This widgets identifies the above mentioned links present in the paragraph
/// and present it in a nice way.
///
/// eg. A paragraph like this
/// '''
///Hello, this is (Rana)[https://medium.com/@ranaranvijaysingh9].
///This is my (YouTube)[https://www.youtube.com/channel/UCl7ETvRjLZsm9qXcxAKCd4w] channel.
///You can find this repository here: https://github.com/RanaRanvijaySingh/flutter_text_anchor.
///'''
///
/// will be converted to
///
/// '''
///Hello, this is Rana.
///This is my YouTube channel.
///You can find this repository here: https://github.com/RanaRanvijaySingh/flutter_text_anchor.
///'''
///
/// How to use it?
///
///             TextAnchor(
///                textColor: Colors.black54,
///                text: 'This is my (YouTube)[https://www.youtube.com/channel/UCl7ETvRjLZsm9qXcxAKCd4w] channel.',
///                linkColor: Colors.pink,
///                onTapLink: (link) {
///                  print(link);
///                },
///              )
///
///This widget internally uses [RichText] and [TextSpan].
///
/// [text] Type: String - It is mandatory field.
/// [onTapLink] Type: Function(String) - It is mandatory field.
/// [textColor] Type: Color - Color for the text with no link.
/// [linkColor] Type: Color - Color for the text with link.
/// [fontSize] Type: double - Size of the text, both with or without link.
/// [fontWeight] Type: FontWeight - FontWeight of the text, normal or bold or italic and so on.
class TextAnchor extends StatelessWidget {
  TextAnchor({
    Key key,
    @required this.text,
    @required this.onTapLink,
    textColor,
    linkColor,
    fontSize,
    this.fontWeight,
  })  : textColor = textColor ?? Colors.black,
        linkColor = linkColor ??= Colors.blueAccent,
        fontSize = fontSize ??= 16.0,
        super(key: key);

  final String text;
  final Color textColor;
  final Color linkColor;
  final double fontSize;
  final FontWeight fontWeight;

  final Function(String) onTapLink;

  @override
  Widget build(BuildContext context) {
    var parser = TextAnchorParser();
    var nodes = parser.getPhrases(text);
    return RichText(
      text: TextSpan(
        children: _createChildren(nodes),
      ),
    );
  }

  List<TextSpan> _createChildren(List<Phrase> nodes) {
    return List<TextSpan>.generate(nodes.length, (int index) {
      var node = nodes[index];
      return TextSpan(
        text: '${nodes[index].outputText}',
        style: TextStyle(
          letterSpacing: 0.0,
          fontSize: fontSize,
          color: node.link == null ? textColor : linkColor,
          fontWeight: fontWeight,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            onTapLink(node.link);
          },
      );
    });
  }
}
