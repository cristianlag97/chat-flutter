import 'dart:io';

import 'package:chat/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {


  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {

  final TextEditingController textController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  bool isText = false;
  final List<ChatMessage> _messages = [
   
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _messages.length,
                reverse: true,
                itemBuilder: (_, int index) => _messages[index]
              ),
            ),
            const Divider(
              height: 5,
              color: Colors.black87,
            ),

            Container(
              color: Colors.white,
              child: _inputChat(),
            )
          ],
        ),
      ),
    );
  }

  Widget _inputChat(){
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                autocorrect: false,
                controller: textController,
                onSubmitted: _handleSubmit,
                onChanged: (value){
                  setState(() {
                    if(value.trim().isNotEmpty){
                      isText = true;
                    } else {
                      isText = false;
                    }
                  });
                },
                decoration: const InputDecoration.collapsed(
                  hintText: 'Enviar mensaje'
                ),
                focusNode: focusNode,
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Platform.isIOS
              ? CupertinoButton(
                child: const Text('Enviar'),
                onPressed: isText ? ()=>_handleSubmit(textController.text) : null
              )
              : Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: IconTheme(
                  data: IconThemeData(color: Colors.blue[400]),
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: const Icon(Icons.send_rounded),
                    onPressed: isText ? ()=>_handleSubmit(textController.text) : null ,
                  ),
                ),
              )
            )

          ],
        ),
      ),
    );
  }


  _handleSubmit(String text) {
    if(text.isEmpty) return;
    print(text);
    textController.clear();
    focusNode.requestFocus();

    final newMessage = ChatMessage(text: text, uuid: '123', animationController:  AnimationController(vsync: this, duration: const Duration(milliseconds: 400)),);
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();

    setState(() {
      isText = false;
    });
  }

  @override
  void dispose() {
    // TODO: off socket

    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }

    super.dispose();
  }

}

class _AppBar extends StatelessWidget  with PreferredSizeWidget {
  const _AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Column(
        children: [
          CircleAvatar(
            child: const Text('Te', style: TextStyle(fontSize: 12)),
            backgroundColor:  Colors.blue[100],
            maxRadius: 14,
          ),
          const SizedBox(height: 5),
          const Text('Melissa Flores', style: TextStyle(color: Colors.black87, fontSize: 12))
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}