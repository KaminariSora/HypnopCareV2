import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class MicrophoneTest extends StatefulWidget {
  const MicrophoneTest({super.key});

  @override
  State<MicrophoneTest> createState() => _MicrophoneTestState();
}

class _MicrophoneTestState extends State<MicrophoneTest> {
  final Map<String, HighlightedWord> _highlights = {
    'flutter': HighlightedWord(
      onTap: () => print('flutter'),
      textStyle: const TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold
      )
    ),
    'voice': HighlightedWord(
      onTap: () => print('voice'),
      textStyle: const TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold
      )
    ),
    'Thunder': HighlightedWord(
      onTap: () => print('Thunder'),
      textStyle: const TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold
      )
    ),
  };
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = '';
  double _confidence = 1.0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _listen() async {
      if(!_isListening) {
        bool avaliable = await _speech.initialize(
          onStatus: (status) => print('onStatus: ${status}'),
          onError: (status) => print('onError: ${status}'),
        );
        if (avaliable) {
          setState(() => _isListening = true);
          _speech.listen(
            onResult: (result) => setState(() {
              _text = result.recognizedWords;
              if(result.hasConfidenceRating && result.confidence > 0) {
                _confidence = result.confidence;
              }
            }),
          );
        }     
      } else {
        setState(()=> _isListening = false);
        _speech.stop();
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confidencelevel: ${(_confidence*100).toStringAsFixed(2)} %'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Theme.of(context).primaryColor,
        duration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: _listen,
          child: Icon(_isListening ? Icons.mic : Icons.mic_none),
          ), 
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 150),
            child: TextHighlight(
              text: _text,
              words: _highlights,
              textStyle: const TextStyle(
                fontSize: 32,
                color: Colors.black,
                fontWeight: FontWeight.w400
              ),
            ),
          ),
        ),
    );
  }
}