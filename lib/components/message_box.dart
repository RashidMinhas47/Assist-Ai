import "package:flutter/material.dart";

import '../core/utils/constants.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({
    super.key,
    required this.size,
    required this.isUser,
    required this.message,
    // required this.date
  });


  final Size size;
  final bool isUser;
  final String message;
  // final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
        // width: size.width*0.7,

        padding: kPadAll8px,
        margin: EdgeInsets.only(
            top: 10, bottom: 10, right: isUser ? 10 :size.width*0.4, left: isUser ?size.width *  0.4:10),
        decoration:  BoxDecoration(
            color: isUser ? Colors.blue:Colors.grey,
            borderRadius: BorderRadius.only(
                topLeft:isUser? kCR8px:kCR0px, bottomLeft: kCR8px, bottomRight: kCR8px,topRight: isUser ? kCR0px:kCR8px)),
        child:  Text(message));
  }
}
