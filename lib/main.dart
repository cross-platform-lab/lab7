import 'package:flutter/material.dart';

import 'story_brain.dart';

// Lab 7: Destini
// Truyện tương tác dạng "chọn lối đi" với hai lựa chọn ở mỗi bước.
void main() {
  runApp(const DestiniApp());
}

class DestiniApp extends StatelessWidget {
  const DestiniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Destini',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final StoryBrain storyBrain = StoryBrain();

  Widget choiceButton(String text, Color color, VoidCallback onPressed) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        padding: const EdgeInsets.all(12),
      ),
      onPressed: onPressed,
      child: Text(text, textAlign: TextAlign.center, style: const TextStyle(fontSize: 20)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: SingleChildScrollView(
                    child: Text(
                      storyBrain.getStory(),
                      style: const TextStyle(fontSize: 24, color: Colors.white, height: 1.4),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: choiceButton(storyBrain.getChoice1(), Colors.red, () {
                  setState(() => storyBrain.nextStory(1));
                }),
              ),
              const SizedBox(height: 20),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: choiceButton(storyBrain.getChoice2(), Colors.blue, () {
                    setState(() => storyBrain.nextStory(2));
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
