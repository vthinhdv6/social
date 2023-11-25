import 'package:flutter/material.dart';
import 'package:social/presentation/screen/upload_video.screen.dart/upload_video_screen.dart';
import 'package:social/presentation/screen/video_social_screen/video_social_screen.dart';



void main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, // Ẩn chữ "DEBUG"
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}

// void main() {
//   runApp(const MaterialApp(
//     home: UpLoadVideoScreen(),
//   ),
//   );
// }

//
// class ChatScreen extends StatefulWidget {
//   @override
//   ChatScreenState createState() => ChatScreenState();
// }
//
// class ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _textController = TextEditingController();
//   final List<ChatMessage> _messages = <ChatMessage>[];
//
//   void _handleSubmitted(String text) {
//     _textController.clear();
//     ChatMessage message = ChatMessage(
//       text: text,
//     );
//     setState(() {
//       _messages.insert(0, message);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Chat App'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Flexible(
//             child: ListView.builder(
//               padding: const EdgeInsets.all(8.0),
//               reverse: true,
//               itemBuilder: (_, int index) => _messages[index],
//               itemCount: _messages.length,
//             ),
//           ),
//           const Divider(height: 1.0),
//           Container(
//             decoration: BoxDecoration(
//               color: Theme.of(context).cardColor,
//             ),
//             child: _buildTextComposer(),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTextComposer() {
//     return IconTheme(
//       data: IconThemeData(color: Theme.of(context).canvasColor),
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 8.0),
//         child: Row(
//           children: <Widget>[
//             Flexible(
//               child: TextField(
//                 controller: _textController,
//                 onSubmitted: _handleSubmitted,
//                 decoration: const InputDecoration.collapsed(hintText: 'Send a message'),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 4.0),
//               child: IconButton(
//                 icon: const Icon(Icons.send),
//                 onPressed: () => _handleSubmitted(_textController.text),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ChatMessage extends StatelessWidget {
//   final String text;
//
//   ChatMessage({required this.text});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Container(
//             margin: const EdgeInsets.only(right: 16.0),
//             child: const CircleAvatar(
//               child: Text('User'),
//             ),
//           ),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text('User', style: Theme.of(context).textTheme.headline6),
//                 Container(
//                   margin: const EdgeInsets.only(top: 5.0),
//                   child: Text(text),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
