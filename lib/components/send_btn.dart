import "package:flutter/material.dart";

class SendBtn extends StatelessWidget {
  const SendBtn({
    super.key,required this.onPressed
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.send_outlined),
      style: IconButton.styleFrom(
          fixedSize:const Size(49, 49), ),
    );
  }
}
