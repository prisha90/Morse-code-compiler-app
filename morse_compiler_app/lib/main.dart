import 'package:flutter/material.dart';
import 'compiler/compiler.dart';

void main() {
  runApp(const MorseCompilerApp());
}

class MorseCompilerApp extends StatelessWidget {
  const MorseCompilerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MorseHome(),
    );
  }
}

class MorseHome extends StatefulWidget {
  const MorseHome({super.key});

  @override
  State<MorseHome> createState() => _MorseHomeState();
}

class _MorseHomeState extends State<MorseHome> {
  String output = '';
  String error = '';

  void handleChange(String text) {
    final result = compile(text);

    setState(() {
      if (result.success) {
        output = result.output;
        error = '';
      } else {
        output = '';
        error = result.error;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.black.withOpacity(0.65),
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Morse Code Compiler',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 16),

                        Card(
                          color: Colors.white.withOpacity(0.9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'How to use Morse Code:\n'
                                  '• .  → Dot\n'
                                  '• -  → Dash\n'
                                  '• Space → Letter separator\n'
                                  '• /  → Word separator\n\n'
                                  'Example:\n'
                                  'HELLO WORLD\n'
                                  '.... . .-.. .-.. --- / .-- --- .-. .-.. -..\n\n'
                                  'Note: Input can be either text or morse code.\n',
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  'No space is required before and after slash.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        TextField(
                          onChanged: handleChange,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Enter text or morse',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        if (error.isNotEmpty)
                          Text(
                            error,
                            style: const TextStyle(color: Colors.redAccent),
                          ),

                        const SizedBox(height: 16),

                        const Text(
                          'Output:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            output,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),

                        const SizedBox(height: 24), // prevents bottom cut
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
