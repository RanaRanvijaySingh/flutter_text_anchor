import 'package:flutter/material.dart';
import 'package:flutter_text_anchor/flutter_text_anchor.dart';

void main() {
  runApp(ExampleScreen());
}

class ExampleScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  final String text = '''
Hello, this is (Rana)[https://medium.com/@ranaranvijaysingh9]. 

This is my (YouTube)[https://www.youtube.com/channel/UCl7ETvRjLZsm9qXcxAKCd4w] channel. 

You can find this repository here: https://github.com/RanaRanvijaySingh/flutter_text_anchor.
              ''';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: key,
        appBar: AppBar(
          title: Text('Text Anchor'),
        ),
        body: Container(
          padding: EdgeInsets.all(24.0),
          child: Column(
            children: <Widget>[
              Divider(),
              Text('Simple text'),
              Divider(),
              Text(text),
              Divider(),
              Text('Text Anchor'),
              Divider(),

              /// Using TextAnchor widget.
              TextAnchor(
                textColor: Colors.black54,
                text: text,
                linkColor: Colors.pink,
                onTapLink: (link) {
                  key.currentState.showSnackBar(SnackBar(content: Text(link)));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
