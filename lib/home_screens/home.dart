import 'dart:convert';

import 'package:flutter/material.dart';
import '../Models/PostsModel.dart';
import 'package:http/http.dart' as http;
class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {

  List<PostsModel> postList= [];

  Future<List<PostsModel>> getPostApi ()async{
    final respons = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(respons.body.toString());
    if(respons.statusCode == 200){
      postList.clear();
      for (Map i in data){
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    }
    else{
      return postList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Column(children: [
  Expanded(
    child: FutureBuilder(future: getPostApi(), builder: (context, snapshot){
      if(!snapshot.hasData){
        return Text('Loading');
      }else{
        return ListView.builder(
            itemCount: postList.length,
            itemBuilder: (context, index){
          return Card(child:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(postList[index].title.toString()),
              ],
            ),
          ));
        });
      }
    }),
  )
],),
    );
  }
}
