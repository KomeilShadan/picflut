import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:picflut/src/widgets/image_list.dart';
import 'models/image_model.dart';
import 'dart:async';
import 'dart:convert';
//emulator -avd Nexus_5X_API_30 -dns-server 8.8.8.8

class App extends StatefulWidget 
{
  const App({Key? key}) : super(key: key);

  @override
  createState() => AppState();
}

class AppState extends State<App> 
{
  var counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async 
  {
    counter++;

    var result = await get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'));
    var imageModel = ImageModel.fromJson(json.decode(result.body));

    setState(() => images.add(imageModel));
  }

  @override

  Widget build(context) 
  {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Picflut App'),
      ),
      body: ImageList(images),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: fetchImage,
      ),
    ),
  );
  }
}