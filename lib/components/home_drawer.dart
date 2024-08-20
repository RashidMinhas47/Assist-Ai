import "package:flutter/material.dart";

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Assist Ai"),
            Divider(),
            Text("Previous Prompts"),
            Expanded(child: ListView.builder(itemCount: 20, itemBuilder: (context,index)=>ListTile(title: Text("title $index"),)))
          ],
        ),
      ),
    );
  }
}
