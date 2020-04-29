# flutter_text_anchor
![pub package](https://img.shields.io/badge/pub-0.0.1-blueviolet.svg)

### Screenshots
<img height="600em" alt="Screenshot 2020-04-30 at 01 56 41" src="https://user-images.githubusercontent.com/4836122/80649072-f5ad8400-8a8e-11ea-9ae4-8cd35073d73c.png"> <img height="600em" alt="Screenshot 2020-04-30 at 01 55 55" src="https://user-images.githubusercontent.com/4836122/80649211-386f5c00-8a8f-11ea-96f3-b5380f217f0a.png">

* A flutter package that helps in creating an anchored text.
* Widget provides freedom to attach multiple link in a text.
* A paragraph for texts including simple links "http://thisisalink.com" or markdown format links "(Some text)[http://thisisalink.com]".
* This widget is build to identify links of both the format present in the paragraph.

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
        text: '''
Hello, this is (Rana)[https://medium.com/@ranaranvijaysingh9]. 
This is my (YouTube)[https://www.youtube.com/channel/UCl7ETvRjLZsm9qXcxAKCd4w] channel. 
You can find this repository here: https://github.com/RanaRanvijaySingh/flutter_text_anchor.
              ''',
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
        text: '''
Hello, this is (Rana)[https://medium.com/@ranaranvijaysingh9]. 
This is my (YouTube)[https://www.youtube.com/channel/UCl7ETvRjLZsm9qXcxAKCd4w] channel. 
You can find this repository here: https://github.com/RanaRanvijaySingh/flutter_text_anchor.
              ''',
        onTapLink: (link) {
            print(link);
        },
    )
```

# Pull Requests

I welcome and encourage all pull requests. It usually will take me within 24-48 hours to respond to any issue or request. Here are some basic rules to follow to ensure timely addition of your request:

1.  Match coding style (braces, spacing, etc.) This is best achieved using `Reformat Code` feature of Android Studio `CMD`+`Option`+`L` on Mac and `CTRL` + `ALT` + `L` on Linux + Windows .
2.  If its a feature, bugfix, or anything please only change code to what you specify.
3.  Please keep PR titles easy to read and descriptive of changes, this will make them easier to merge :)
4.  Pull requests _must_ be made against `develop` branch. Any other branch (unless specified by the maintainers) will get rejected.
5.  Make sure you follow the set standard as all other projects in this repo do


For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

# License

    Copyright 2020 Rana Ranvijay Singh

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
