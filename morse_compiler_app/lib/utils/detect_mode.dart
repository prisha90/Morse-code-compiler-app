enum InputMode { text, morse }

InputMode detectMode(String input) {
  if (input.contains('.') || input.contains('-')) {
    return InputMode.morse;
  }
  return InputMode.text;
}
