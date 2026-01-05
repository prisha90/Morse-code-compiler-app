import '../data/morse_map.dart';

class TrieNode {
  String? char;
  TrieNode? dot;
  TrieNode? dash;

  TrieNode({this.char});
}

class MorseTrie {
  final TrieNode root = TrieNode();

  void insert(String morse, String char) {
    var node = root;
    for (final symbol in morse.split('')) {
      if (symbol == '.') {
        node.dot ??= TrieNode();
        node = node.dot!;
      } else if (symbol == '-') {
        node.dash ??= TrieNode();
        node = node.dash!;
      }
    }
    node.char = char;
  }
}

