import "package:flutter/material.dart";

class MessageField extends StatelessWidget {
  const MessageField({
    super.key,this.onChanged,this.controller
  });
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: Padding(padding: EdgeInsetsDirectional.only(start: 4), child: Icon(Icons.message_outlined,size: 20,)),
            hintText: "Message",
            // fillColor: Colors.black87,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
