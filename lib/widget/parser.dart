import 'phrase.dart';

abstract class Parser {
  final String regxForGitMarkdownUrl = r'\(([^)]+)\)[ ]*[\[]{1}[ ]*(http|https|ftp):\/\/[\S]+[ ]*[\]]{1}';
  final String regxForJustUrl = r'(http|https|ftp):\/\/[^ \]]+';
  final String regxForBothSimpleAndMarkdownUrl =
      r'(\(([^)]+)\)[ ]*[\[]{1}[ ]*(http|https|ftp):\/\/[\S]+[ ]*[\]]{1})|((http|https|ftp):\/\/[^ \]]+)';

  final String regxForTextInBraces = r'\(([^)]+)\)';

  List<Phrase> getPhrases(String text);
}
