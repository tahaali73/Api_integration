import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({super.key});

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  List<Photos> PhotoList = [];
  Future<List<Photos>> getPhotos() async {
    final response= await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map i in data){
        Photos photos = Photos(title: i['title'], url: i['url'], id: i['id']);
        PhotoList.add(photos);

      }
      return PhotoList;
    }
    else{
      return PhotoList;
    }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(child: FutureBuilder(
          future: getPhotos(),
          builder: (context, AsyncSnapshot<List<Photos>> snapshot){
            return ListView.builder(
                itemCount: PhotoList.length,
                itemBuilder: (context, index){
            return ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(snapshot
              .data![index].title.toString()),),
              subtitle: Text(snapshot.data![index].title.toString()),
              title: Text(snapshot.data![index].id.toString()),
            );
            });
        },
        ))
      ],),
    );
  }
}
class Photos {
  String title, url;
  int id ;
  Photos({required this.id,required this.title,required this.url});
}