# **Morse Code Compiler – Cross-Platform Application**

## **1. Introduction**

Morse code is one of the earliest methods of digital communication, representing characters using sequences of dots (`.`) and dashes (`-`). Although simple in concept, Morse code provides an excellent foundation for understanding **language translation, parsing and compiler design concepts**.

This project, **Morse Code Compiler**, aims to design and implement a **compiler-like system** that translates:

* **Plain English text → Morse code**
* **Morse code → Plain English text**

The application is implemented as a **cross-platform mobile application using Flutter**, integrating classical **compiler phases** such as lexical analysis, parsing, semantic analysis, intermediate representation (IR) and code generation.

The project demonstrates both:

* **Core compiler construction principles**
* **Modern cross-platform app development**

---

## **2. Objectives**

The main objectives of this project are:

1. To design a **compiler-based translation system** for Morse code.
2. To implement a **Trie-based parser** for efficient Morse decoding.
3. To apply classical compiler phases in a real-world application.
4. To build a **cross-platform mobile application** using Flutter.
5. To provide **real-time validation and translation** of input.
6. To enhance understanding of **language processing and app architecture**.

---

## **3. Scope of the Project**

The scope of this project includes:

* Translation between **English alphabets (A–Z)** and Morse code.
* Support for **word separation using a single space**, eliminating letter separators.
* Real-time error detection for invalid Morse sequences.
* A clean and simple user interface.
* Cross-platform support for **Android, iOS and Web** via Flutter.

Limitations:

* Digits and punctuation are not included in the current version.
* Audio (beep) output is not implemented.

---

## **4. System Architecture**

The project follows a **compiler-inspired pipeline**, shown below:

```
Input
 ↓
Mode Detection (Text / Morse)
 ↓
Lexer
 ↓
Parser (Trie-based)
 ↓
Semantic Analyzer
 ↓
Intermediate Representation (IR)
 ↓
Code Generator
 ↓
Output
```

This architecture ensures **clear separation of concerns**, maintainability and extensibility.

---

## **5. Technology Stack**

| Component            | Technology         |
| -------------------- | ------------------ |
| Programming Language | Dart               |
| Framework            | Flutter            |
| Architecture         | Compiler-based     |
| Parsing Method       | Trie-based parsing |
| Platforms            | Android, iOS, Web  |

---

## **6. Design Decisions**

### 6.1 Word Separation Strategy

Instead of traditional Morse rules (letter gaps and word gaps), this project uses:

* `.` → DOT
* `-` → DASH
* `' '` (single space) → **Letter separator**
* `/` (slash) → **Word separator**

This simplifies input handling and improves usability for beginners.

---

### 6.2 Trie-Based Parsing

A **Trie (prefix tree)** is used to store Morse sequences. This allows:

* Efficient traversal of Morse symbols
* Early detection of invalid sequences
* Clean mapping from dot-dash sequences to characters

---

## **7. Module Description**

### 7.1 Lexer

The lexer scans the input and converts it into tokens:

* `.` → DOT
* `-` → DASH
* `' '` → WORD_SEPARATOR

Invalid characters are rejected at this stage.

---

### 7.2 Parser

The parser:

* Traverses the Morse Trie based on dot/dash tokens
* Converts valid paths into characters
* Groups characters into words using spaces

This parser does **not require explicit letter separators**, making it unique.

---

### 7.3 Semantic Analyzer

The semantic analyzer ensures:

* Input is not empty
* Parsed Morse sequences are complete and valid

---

### 7.4 Intermediate Representation (IR)

The IR acts as a neutral structure between parsing and output generation.

```text
IR
 ├── Word
 │    ├── Letter
 │    ├── Letter
```

This abstraction makes the compiler extensible for future features.

---

### 7.5 Code Generator

Depending on the detected mode:

* Generates Morse code from text
* Generates plain text from IR

---

### 7.6 Mode Detection

The system automatically detects input type:

* Presence of `.` or `-` → Morse to Text
* Otherwise → Text to Morse

---

## **8. User Interface Design**

The Flutter UI includes:

* Input text field
* Real-time output display
* Error message display
* Minimal, distraction-free layout

The UI is decoupled from compiler logic, following **clean architecture principles**.

---

## **9. Testing and Validation**

### Test Cases:

| Input       | Expected Output                             |
| ----------- | -----------------------------------         |
| HELLO WORLD | .... . .-.. .-.. ---/.-- --- .-. .-.. -..   |
| `....`      | H                                           |
| `.-.-`      | Error (invalid sequence)                    |
| Empty input | Error                                       |

The compiler correctly handles valid inputs and reports errors gracefully.

---

## **10. Results**

The application successfully:

* Translates text to Morse code
* Decodes Morse code using Trie parsing
* Detects invalid inputs
* Runs smoothly on multiple platforms

Performance is efficient due to Trie-based parsing and lightweight Dart execution.

---

## **11. Future Enhancements**

Possible extensions include:

1. Support for numbers and punctuation
2. Morse audio playback (beeps)
3. Visualization of Trie traversal
4. Offline dictionary expansion
5. Export/share functionality
6. Unit testing and benchmarking

---

## **12. Conclusion**

This project successfully demonstrates how **compiler design principles** can be applied to a real-world problem using modern technologies. By combining **lexical analysis, parsing, semantic checking and code generation** within a Flutter application, the Morse Code Compiler serves as both an **educational tool** and a **functional application**.

The project strengthened understanding of:

* Compiler architecture
* Data structures (Trie)
* Cross-platform mobile development
* Clean software design practices

---

## **13. References**

1. Aho, Lam, Sethi, Ullman – *Compilers: Principles, Techniques & Tools*
2. Flutter Documentation – [https://flutter.dev](https://flutter.dev)
3. Morse Code Reference – ITU Recommendation


TO RUN:
C:\flutter\bin\flutter.bat clean
C:\flutter\bin\flutter.bat pub get

C:\flutter\bin\flutter.bat run   

C:\flutter\bin\flutter.bat run -d chrome
C:\flutter\bin\flutter.bat run -d edge


C:\flutter\bin\flutter.bat devices
C:\flutter\bin\flutter.bat run -d <device_id>



morse_compiler_app/
│
├── assets/
│   │   └── images
│   │       └── background.jpg
│
├── lib/
│   ├── compiler/
│   │   ├── lexer.dart
│   │   ├── morse_trie.dart
│   │   ├── parser.dart
│   │   ├── semantic.dart
│   │   ├── ir.dart
│   │   ├── compiler.dart
│   │   └── codegen.dart
│   │
│   ├── data/
│   │   └── morse_map.dart
│   │
│   ├── utils/
│   │   └── detect_mode.dart
│   │
│   └── main.dart
│
├── pubspec.yaml
└── README.md
