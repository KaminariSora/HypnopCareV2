import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hypno_care_v2/const.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypno_care_v2/globalVariable.dart' as globals;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  String bmi = globals.bmi.value;
  String height = globals.height;
  String weight = globals.weight;
  String age = globals.age;
  String sodium = globals.sodium.value;

  @override
  void initState() {
    super.initState();
    globals.bmi.addListener(_updateBmi);
    globals.sodium.addListener(_updateSodium);
  }

  void _updateBmi() {
    if (!mounted) return;
    setState(() {
      bmi = globals.bmi.value;
    });
  }

  void _updateSodium() {
    if (!mounted) return;
    setState(() {
      sodium = globals.sodium.value;
    });
  }

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

    String botReply = await _getBotReply(userMessage);

    setState(() {
      _messages.insert(0, {
        'text': botReply,
        'isUser': false,
        'timestamp': DateTime.now(),
      });
    });
  }

  Future<String> _getBotReply(String message) async {
    try {
      final response = await http.post(
        Uri.parse('$apiUrl?key=$geminiAPI'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "contents": [
            {
              "role": "model",
              "parts": [
                {
                  "text": "You are a hypertension (high blood pressure) specialist. "
                      "Your patient will provide the following details:\n\n"
                      "BMI: $bmi\n"
                      "Height: $height cm\n"
                      "Weight: $weight kg\n"
                      "Age: $age years\n"
                      "Sodium intake: $sodium mg\n\n"
                      "You should remember this information and ONLY respond to questions related to this data. "
                      "Do NOT provide any other information unless specifically asked by the user. "
                      "Your response must be concise and clear. "
                }
              ]
            },
            {
              "role": "user",
              "parts": [
                {"text": message}
              ]
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["candidates"]?[0]["content"]["parts"][0]["text"] ??
            "No response.";
      } else {
        return "Error: ${response.statusCode} - ${response.body}";
      }
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
