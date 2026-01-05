import '../data/morse_map.dart';
import 'ir.dart';

String generateText(IR ir) {
  return ir.words.map((w) => w.join()).join(' ');
}

String generateMorse(String text) {
  final words = text.toUpperCase().split(' ');
  final result = <String>[];

  for (final word in words) {
    final letters = word.split('');
    final morseLetters = letters.map((c) {
      if (!textToMorse.containsKey(c)) {
        throw Exception('Unsupported character: $c');
      }
      return textToMorse[c]!;
    }).join(' ');
    result.add(morseLetters);
  }

  return result.join(' / ');
}




