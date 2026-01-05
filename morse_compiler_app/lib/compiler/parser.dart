import 'lexer.dart';
import 'morse_trie.dart';
import 'ir.dart';

IR parseMorse(List<Token> tokens, MorseTrie trie) {
  final List<List<String>> words = [];
  List<String> currentWord = [];
  var currentNode = trie.root;

  void endLetter(int pos) {
    if (currentNode.char == null) {
      throw Exception('Invalid Morse sequence near position $pos');
    }
    currentWord.add(currentNode.char!);
    currentNode = trie.root;
  }

  for (final token in tokens) {
    switch (token.type) {
      case TokenType.dot:
        if (currentNode.dot == null) {
          throw Exception(
              'Invalid Morse sequence near position ${token.position}');
        }
        currentNode = currentNode.dot!;
        break;

      case TokenType.dash:
        if (currentNode.dash == null) {
          throw Exception(
              'Invalid Morse sequence near position ${token.position}');
        }
        currentNode = currentNode.dash!;
        break;

      case TokenType.letterGap:
        endLetter(token.position);
        break;

      case TokenType.wordGap:
        endLetter(token.position);
        words.add(currentWord);
        currentWord = [];
        break;
    }
  }

  if (currentNode != trie.root) {
    endLetter(tokens.last.position);
  }

  if (currentWord.isNotEmpty) {
    words.add(currentWord);
  }

  return IR(words);
}
