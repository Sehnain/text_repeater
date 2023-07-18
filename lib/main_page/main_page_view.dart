import 'package:flutter/material.dart';
import '../convert_to_emoji/convert_to_emoji_screen.dart';
import '../emoji_repeater_app/emoji_repeater.dart';
import '../text_repeter_app/repeter.dart';

class MainPageScreen extends StatelessWidget {
  const MainPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RepeatedTextScreen()));
                },
                child: const Text("Text repeater")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EmojiScreen()));
                },
                child: const Text("Emoji repeater")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EmojiTextScreen()));
                },
                child: const Text("Convert to Emoji ")),
          ],
        ),
      ),
    );
  }
}
