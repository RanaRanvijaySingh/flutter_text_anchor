import 'parser.dart';
import 'phrase.dart';

class TextAnchorParser extends Parser {
  @override
  List<Phrase> getPhrases(String text) {
    var phrases = <Phrase>[];
    if (text == null || text.isEmpty) {
      return phrases;
    }
    var breakpoints = _findIndexPositionForPhrase(text);
    phrases = _buildPhrases(breakpoints, text);
    return phrases;
  }

  List _findIndexPositionForPhrase(String text) {
    var regxPlainMarkdownUrl = RegExp(regxForBothSimpleAndMarkdownUrl);
    Iterable iterable = regxPlainMarkdownUrl.allMatches(text);
    var indexPositions = [];
    indexPositions.add(0);
    iterable.forEach((element) {
      indexPositions.add(element.start);
      indexPositions.add(element.end);
    });
    indexPositions.add(text.length);
    return indexPositions;
  }

  List<Phrase> _buildPhrases(List indexPositions, String text) {
    var phrases = <Phrase>[];
    for (var i = 0; i < indexPositions.length - 1; i++) {
      int startPosition = indexPositions[i];
      int endPosition = indexPositions[i + 1];
      var substring = text.substring(startPosition, endPosition);
      var regxPlainUrl = RegExp(regxForJustUrl);
      var node = Phrase(inputText: substring);
      if (regxPlainUrl.hasMatch(substring)) {
        var match = regxPlainUrl.firstMatch(substring);
        node.link = substring.substring(match.start, match.end);
        var regxMarkdownUrl = RegExp(regxForGitMarkdownUrl);
        if (regxMarkdownUrl.hasMatch(substring)) {
          var regxBracedWord = RegExp(regxForTextInBraces);
          var matchMarkDown = regxBracedWord.firstMatch(substring);
          node.outputText = substring.substring(matchMarkDown.start + 1, matchMarkDown.end - 1);
        } else {
          node.outputText = substring.substring(match.start, match.end);
        }
      } else {
        node.outputText = substring;
      }
      phrases.add(node);
    }
    return phrases;
  }
}
