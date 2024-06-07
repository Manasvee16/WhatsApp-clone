import 'package:flutter/material.dart';
import 'package:custom_clippers/custom_clippers.dart';
class ChatSamples extends StatelessWidget {
  const ChatSamples({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(right: 80),
        child: ClipPath(
          clipper: UpperNipMessageClipperTwo(MessageType.receive),
          child: Container(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 10),
            color: Colors.white,
            child: Text("Hi, how are you",
            style: TextStyle(fontSize: 16.5),
            ),
            ),
        ),
        ),
        Container(
          alignment: Alignment.centerRight,
          margin:EdgeInsets.only(top: 20, left: 80, bottom: 15),
          child: ClipPath(
            clipper: UpperNipMessageClipperTwo(MessageType.send),
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 20),
              color: Color(0xFFE7FFDB),
              child: Text("Hi, I'm good, and you?",
              style: TextStyle(
                fontSize: 16.5
              ),
              ),
            ),
            ),
        ),
      ],
    );
  }
}