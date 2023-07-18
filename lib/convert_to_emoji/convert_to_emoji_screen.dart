import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class EmojiTextScreen extends StatefulWidget {
  const EmojiTextScreen({super.key});

  @override
  State<EmojiTextScreen> createState() => _EmojiTextScreenState();
}

class _EmojiTextScreenState extends State<EmojiTextScreen> {
  String userInput = '';

  String convertToEmojis() {
    final parser = EmojiParser();
    final emojis = parser.emojify(userInput);
    return emojis;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emoji Text Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  userInput = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Enter Text',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Converted Text:',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              convertToEmojis(),
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

