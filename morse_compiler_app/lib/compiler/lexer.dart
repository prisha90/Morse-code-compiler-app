enum TokenType { dot, dash, letterGap, wordGap }

class Token {
  final TokenType type;
  final int position;

  Token(this.type, this.position);
}

List<Token> lexer(String input) {
  final tokens = <Token>[];

  for (int i = 0; i < input.length; i++) {
    final ch = input[i];

    if (ch == '.') {
      tokens.add(Token(TokenType.dot, i));
    } else if (ch == '-') {
      tokens.add(Token(TokenType.dash, i));
    } else if (ch == ' ') {
      tokens.add(Token(TokenType.letterGap, i));
    } else if (ch == '/') {
      tokens.add(Token(TokenType.wordGap, i));
    } else {
      throw Exception('Invalid character "$ch" at position $i');
    }
  }

  return tokens;
}
