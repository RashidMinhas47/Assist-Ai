import 'package:assist_ai/components/home_drawer.dart';
import 'package:assist_ai/components/message_field.dart';
import 'package:assist_ai/components/send_btn.dart';
import 'package:assist_ai/components/message_box.dart';
import 'package:assist_ai/core/services/ai_service.dart';
import 'package:assist_ai/provider/chat_provider.dart';
import 'package:assist_ai/provider/theme_provider.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/constants.dart';
import '../../provider/textediting_ctr.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final Size size = MediaQuery.of(context).size;
    final chatModel = ref.watch(chatProvider);
    final chatProv = ref.watch(chatProvider.notifier);
    final messageCtrPro = ref.watch(messageCtrProvider);
    final themeProvider = ref.watch(appThemeStateNotifier);

    return Scaffold(
      drawer:const HomeDrawer(),
        appBar: AppBar(
          title: const Text("Assist ai"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  chatProv.clearAllSharedPreferencesData();

                },
                icon: const Icon(Icons.delete_outline)),
            IconButton(onPressed: (){
              themeProvider.toggleTheme();
            }, icon:  Icon(themeProvider.isDarkModeEnabled? Icons.dark_mode :Icons.light_mode))
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: chatModel.messages.length,
                    itemBuilder: (context, index) => MessageBox(
                          size: size,
                          isUser: chatModel.messages[index].isUser,
                          message: chatModel.messages[index].message,
                        ))),
            chatProv.isSending ? const CircularProgressIndicator() : const SizedBox.shrink(),
            Container(
              height: 70,
              width: size.width,
              color: Colors.transparent,
              margin: kPadHrz10px,
              child: Row(
                children: [
                  MessageField(
                    controller: messageCtrPro,
                  ),
                  kGap10px,
                  SendBtn(
                    onPressed: () {
                      // AIService().generateText("Who are You!");
                      if (messageCtrPro.text.isNotEmpty &&
                          chatProv.isSending == false) {
                        chatProv.sendMessage(messageCtrPro.text,ref);
                      }
                      // messageCtrPro.clear();
                    },
                  )
                ],
              ),
            )
          ],
        ));
  }
}

// import 'package:assist_ai/components/home_drawer.dart';
// import 'package:assist_ai/components/message_field.dart';
// import 'package:assist_ai/components/send_btn.dart';
// import 'package:assist_ai/components/message_box.dart';
// import 'package:assist_ai/core/services/ai_service.dart';
// import "package:flutter/material.dart";
//
// import '../../core/utils/constants.dart';
//
// class Home extends StatelessWidget {
//   const Home({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       drawer: const HomeDrawer(),
//       appBar: AppBar(title:const Text("Assist ai"), centerTitle: true),
//       body: Stack(
//         children: [
//           Column(
//
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Expanded(
//                   child: ListView.builder(
//                       itemCount: 30,
//                       itemBuilder: (context, index) => MessageBox(size: size,isUser: true
//                         ,date: DateTime.now(),message: "Hello World! jghfddfdfdfdfdfdfdfdfdfdfdfdfdfdfdfd dfd sdf",))),
//             ],
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Container(
//                 height: 70,
//                 width: size.width,
//                 color: Colors.transparent,
//                 margin: kPadHrz10px,
//                 child: Row(
//                   children: [
//                     const MessageField(),
//                     kGap10px,
//                     SendBtn(
//                       onPressed: () {
//                         AIService().generateText("Who are You!");
//                       },
//                     )
//                   ],
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
