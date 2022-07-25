import 'package:flutter/material.dart';
import '../models/image_model.dart';


class ImageList extends StatelessWidget 
{
  final List<ImageModel> images;

  ImageList(this.images);

  Widget build (context) 
  {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) 
      {
        return buildImage(images[index]);
      }
    );
  }

  buildImage(ImageModel image) 
  {
    return Container(
            margin: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey)
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Padding(
                  child: Image.network(image.url),
                  padding: const EdgeInsets.only(
                    bottom: 10.0,
                    ),
                  ),
                Text(image.title),
              ],
            ),
          );
  }
}