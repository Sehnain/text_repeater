import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class RepeatedTextScreen extends StatefulWidget {
  const RepeatedTextScreen({super.key});

  @override
  State<RepeatedTextScreen> createState() => _RepeatedTextScreenState();
}

class _RepeatedTextScreenState extends State<RepeatedTextScreen> {
  String userInput = '';
  int repeatCount = 0;

  List<String> repeatedTextList = [];

  void generateRepeatedText() {
    repeatedTextList = List<String>.generate(repeatCount, (index) => userInput);
  }

  void copyToClipboard() {
    String copiedText = repeatedTextList.join('\n');
    Clipboard.setData(ClipboardData(text: copiedText));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Text copied to clipboard')),
    );
  }

  void shareText() {
    String sharedText = repeatedTextList.join('\n');
    Share.share(sharedText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repeated Text Display'),
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
            TextField(
              onChanged: (value) {
                setState(() {
                  repeatCount = int.tryParse(value) ?? 0;
                  generateRepeatedText();
                });
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Integer',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Repeated Text:',
              style: TextStyle(fontSize: 18.0),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: repeatCount,
                itemBuilder: (context, index) => Text(
                  repeatedTextList[index],
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: copyToClipboard,
                  child: const Text('Copy to Clipboard'),
                ),
                ElevatedButton(
                  onPressed: shareText,
                  child: const Text('Share'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


