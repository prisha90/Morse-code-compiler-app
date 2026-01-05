import 'lexer.dart';
import 'parser.dart';
import 'morse_trie.dart';
import 'semantic.dart';
import 'ir.dart';
import 'codegen.dart';
import '../utils/detect_mode.dart';
import '../data/morse_map.dart';

class CompileResult {
  final bool success;
  final String output;
  final String error;

  CompileResult.success(this.output)
      : success = true,
        error = '';

  CompileResult.failure(this.error)
      : success = false,
        output = '';
}

CompileResult compile(String input) {
  try {
    semanticCheck(input);

    final mode = detectMode(input);

    if (mode == InputMode.text) {
      final morse = generateMorse(input);
      return CompileResult.success(morse);
    }

    final trie = MorseTrie();
    morseToText.forEach((morse, char) {
      trie.insert(morse, char);
    });

    final tokens = lexer(input);
    final ir = parseMorse(tokens, trie);
    final text = generateText(ir);

    return CompileResult.success(text);
  } catch (e) {
    return CompileResult.failure(e.toString());
  }
}
