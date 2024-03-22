import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:insta/components/Header/Header.dart';
import 'package:intl/intl.dart';

class Chatboard extends StatefulWidget {
  const Chatboard({Key? key}) : super(key: key);

  @override
  _ChatboardState createState() => _ChatboardState();
}

class _ChatboardState extends State<Chatboard> {
  final _message = TextEditingController();
  bool isMsg = false;
  List<Message> messages = [
    Message(text: "hy", sender: true),
    Message(text: "hello", sender: true),
  ];

  ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _message.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant Chatboard oldWidget) {
    super.didUpdateWidget(oldWidget);
    _scrollToLastMessage();
  }

  @override
  void initState() {
    super.initState();
    _message.addListener(() {
      setState(() {
        if (_message.text.isNotEmpty) {
          isMsg = true;
        } else {
          isMsg = false;
        }
      });
    });
  }

  void _sendmessages(String message) {
    setState(() {
      messages.add(Message(text: message, sender: false));
      _message.clear();
    });
    Timer(const Duration(milliseconds: 300), () {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  void _scrollToLastMessage() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    String _datetime = DateFormat('h:mm a').format(DateTime.now());
    return Scaffold(
      appBar: const MessageHeaderState(fromScreen: "chatboard"),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Align(
                child: Text(
                  "Today ${_datetime}",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          bool isMsgLast = index == messages.length - 1;
                          Message message = messages[index];
                          bool isSender = message.sender;

                          return ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0, right: 10, top: 5),
                                  child: isMsgLast && !isSender
                                      ? const CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"),
                                          radius: 12,
                                        )
                                      : const SizedBox(
                                          width: 25,
                                        ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: isSender
                                        ? Alignment.topRight
                                        : Alignment.topLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(
                                                isSender ? 5 : 20),
                                            bottomRight:
                                                const Radius.circular(20),
                                            bottomLeft:
                                                const Radius.circular(20),
                                            topLeft: Radius.circular(
                                                isSender ? 20 : 5)),
                                        color: isSender
                                            ? Colors.blue
                                            : Colors.grey[850],
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        message.text,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              alignment: Alignment.bottomCenter,
              height: 50,
              child: TextField(
                controller: _message,
                onSubmitted: (text) => _sendmessages(text),
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Message...',
                  filled: true,
                  fillColor: Colors.grey[850],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                  hintStyle: const TextStyle(
                    color: Colors.white38,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.5,
                  ),
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(2.5),
                    child: IconButton(
                      onPressed: null,
                      color: Colors.blue,
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(0))),
                      icon: Icon(
                        isMsg ? Icons.search : Icons.camera_alt,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      !isMsg
                          ? Row(children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.mic_none_outlined,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  // Handle camera icon tap
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.image_outlined,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  // Handle image icon tap
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.card_giftcard_outlined,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  // Handle send icon tap
                                },
                              )
                            ])
                          : TextButton(
                              onPressed: () {
                                _sendmessages(_message.text);
                                _message.clear();
                              },
                              child: const Text(
                                "Send",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

class Message {
  final String text;
  final bool sender;
  final DateTime timestamp = DateTime.now();

  Message({
    required this.text,
    required this.sender,
  });

  operator [](int index) => text.codeUnits[index];
}
