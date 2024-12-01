import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:stray_nest/Messages.dart';

class Chatbox extends StatefulWidget {
  const Chatbox(
     {super.key});
   

  @override
  State<Chatbox> createState() => _ChatboxState();
}

class _ChatboxState extends State<Chatbox> {
  late DialogFlowtter dialogFlowtter;
 

  final TextEditingController _controller = TextEditingController();
  List<Map<String,dynamic>> messages = [];
   
  
  @override
  void initState() {
    super.initState();
     DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 249, 249, 249),
        elevation: 5,
        leading: IconButton(
          
          icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 246, 146, 70)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: const Text(
            'ChatBox Assistance',
            style: TextStyle(
              color:Color.fromARGB(255, 246, 146, 70),
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Message Display Area
          Expanded(
            child: MessagesScreen(messages: messages),
          ),
          // Input Box
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            color:const Color.fromARGB(255, 226, 229, 234),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Type something...",
                      hintStyle: TextStyle(color: Color.fromARGB(255, 186, 189, 194)),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    sendMessage(_controller.text);
                    _controller.clear();
                  },
                  icon: const Icon(Icons.send, color: Color.fromARGB(255, 246, 146, 70)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}
