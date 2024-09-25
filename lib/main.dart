import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InstagramCloneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const InstagramHomePage(),
    );
  }
}

class InstagramHomePage extends StatefulWidget {
  const InstagramHomePage({Key? key}) : super(key: key);

  @override
  _InstagramHomePageState createState() => _InstagramHomePageState();
}

class _InstagramHomePageState extends State<InstagramHomePage> {
  final ImagePicker _imagePicker = ImagePicker();
  List<String> posts = [
    'https://images.unsplash.com/photo-1686529299806-c10443382320?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfDF8fGVuZ2xhbmR8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1686529299806-c10443382320?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfDF8fGVuZ2xhbmR8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1686529299806-c10443382320?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfDF8fGVuZ2xhbmR8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
  ];

  void _pickImage() async {
    final XFile? pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        posts.insert(0, pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram Clone'),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera),
            onPressed: _pickImage,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Container(
            child: Image.network(posts[index]),
            padding: const EdgeInsets.all(8.0),
          );
        },
      ),
    );
  }
}