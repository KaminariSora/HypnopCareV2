import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hypno_care_v2/const.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  @override
  void initState() {
    super.initState();
  }

  var bmi = 22.5;
  var sex = "Male";
  var height = 175;
  var weight = 75;
  var age = 22;
  var sodium = 1500;

  void _sendMessage() async {
    if (_controller.text.trim().isEmpty) return;

    String userMessage = _controller.text;
    _controller.clear();

    setState(() {
      _messages.insert(0, {
        'text': userMessage,
        'isUser': true,
        'timestamp': DateTime.now(),
      });
    });

    // แสดงข้อความเริ่มต้นของ Bot ก่อนรับ Streaming
    setState(() {
      _messages.insert(0, {
        'text': "...", // Placeholder ก่อนรับข้อความจริง
        'isUser': false,
        'timestamp': DateTime.now(),
      });
    });

    await _getBotReply(userMessage);
  }

  void _updateBotMessage(String botReply) {
    if (mounted) {
      setState(() {
        if (_messages.isNotEmpty && !_messages.first['isUser']) {
          _messages.first['text'] = botReply; // อัปเดตข้อความเดิม
        } else {
          _messages.insert(0, {
            'text': botReply,
            'isUser': false,
            'timestamp': DateTime.now(),
          });
        }
      });
    }
  }

  Future<String> _getBotReply(String message) async {
    try {
      final request = http.Request(
        "POST",
        Uri.parse('$NgrokUrl$ollamaAPI'),
      );

      request.headers["Content-Type"] = "application/json";
      request.body = jsonEncode({
        "model": "thewindmom/llama3-med42-8b",
        "prompt": """
        You are a medical expert specializing in hypertension and nutrition.  

    Analyze the user's health condition based on the following data:  
    - BMI: $bmi  
    - Sex: $sex  
    - Height: $height cm  
    - Weight: $weight kg  
    - Age: $age years  
    - Daily sodium intake: $sodium mg  

    Questions : $message

    Please provide the response in **clear and simple Thai language**, ensuring that it is easy for the user to understand.
      """,
        "stream": true, // เปิด Streaming
        "temperature": 0.3,
        "top_k": 30,
        "top_p": 0.8,
        "num_predict": 300,
        "stop": []
      });

      final response = await http.Client().send(request);
      String botReply = "";

      // อ่าน Stream และรวมข้อความ
      await for (var chunk in response.stream.transform(utf8.decoder)) {
        final decodedChunk = jsonDecode(chunk);
        if (decodedChunk.containsKey("response")) {
          botReply += decodedChunk["response"];
          // อัปเดต UI ทันทีเมื่อได้ข้อความใหม่
          _updateBotMessage(botReply);
        }
      }

      return botReply;
    } catch (e) {
      return "Error: $e";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2E5D2),
      appBar: AppBar(
        title: const Text("HypnoCare Chat",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFFFFF),
            )),
        centerTitle: true,
        backgroundColor: const Color(0xFF5E7F60),
        elevation: 4,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ChatBubble(
                  message: message['text'],
                  isUser: message['isUser'],
                  timestamp: message['timestamp'],
                );
              },
            ),
          ),
          _buildInputField(),
        ],
      ),
    );
  }

  Widget _buildInputField() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      color: const Color(0xFFBFBB95),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.add_circle, color: Color(0xFF4F513C)),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Color(0xFF4F513C)),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;
  final DateTime timestamp;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isUser,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isUser ? const Color(0xFF5E7F60) : const Color(0xFFBFBB95),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment:
              isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: TextStyle(
                color: isUser ? Colors.white : Colors.black87,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}',
              style: TextStyle(
                fontSize: 12,
                color: isUser ? Colors.white70 : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
