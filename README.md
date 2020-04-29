# flutter_text_anchor
[![pub package](https://img.shields.io/badge/pub-0.0.1-blueviolet.svg)]

A flutter package that helps in creating an anchored text.
Widget provides freedom to attach multiple link in a text.
A paragraph for texts including simple links "http://..." or markdown format links "(Some text)[http://...]".
This widget is build to identify links of both the format present in the paragraph.

## Installing:
In your pubspec.yaml
```yaml
dependencies:
  flutter_text_anchor: ^0.0.1
```
```dart
import 'package:flutter_text_anchor/flutter_text_anchor.dart';
```


## Basic Usage:
```dart
    TextAnchor(
        text: 'This is my (YouTube)[https://www.youtube.com/channel/UCl7ETvRjLZsm9qXcxAKCd4w] channel.',
        onTapLink: (link) {
            print(link);
        },
    )
```

```dart
    TextAnchor(
        textColor: Colors.black54,
        linkColor: Colors.pink,
        fontWeight: FontWeight.w300,
        fontSize: 18.0,
        text: 'This is my (YouTube)[https://www.youtube.com/channel/UCl7ETvRjLZsm9qXcxAKCd4w] channel.',
        onTapLink: (link) {
            print(link);
        },
    )
```

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
