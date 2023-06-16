import 'package:flutter/material.dart';

import '../model/post.dart';
import '../services/Network.dart';

class Creates extends StatefulWidget {
  const Creates({super.key});
static const String id = 'getID';
  @override
  State<Creates> createState() => _CreatesState();
}

class _CreatesState extends State<Creates> {

 // late String id;
  late String title;
  late String body;
  //late String userId;

  var isLoading = false;

  void _apiPostCreate(Post post) {
    setState(() {
      isLoading = true;
    });
    var response = Network.POST(Network.API_CREATE, Network.paramsCreate(post));
    setState(() {
      isLoading = false;
      if(response != null){

      }else{
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // TextFormField(
          //   style: const TextStyle(color: Colors.black),
          //   decoration: InputDecoration(
          //       labelText: 'id',
          //       border: const OutlineInputBorder()
          //   ),
          //   validator: (value) {
          //     if (value != null && value.isEmpty) {
          //       return 'id must not be empty';
          //     }
          //     return null;
          //   },
          //   onChanged: (value) => setState(() => id = value),
          // ),
          SizedBox(height: 10,),
          TextFormField(
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
                labelText: 'title',
                border: const OutlineInputBorder()
            ),
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'title must not be empty';
              }
              return null;
            },
            onChanged: (value) => setState(() => title = value),
          ),
          SizedBox(height: 10,),
          TextFormField(
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
                labelText: 'body',
                border: const OutlineInputBorder()
            ),
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'body must not be empty';
              }
              return null;
            },
            onChanged: (value) => setState(() => body = value),
          ),
          SizedBox(height: 10,),
          // TextFormField(
          //   style: const TextStyle(color: Colors.black),
          //   decoration: InputDecoration(
          //       labelText: 'userId',
          //       border: const OutlineInputBorder()
          //   ),
          //   validator: (value) {
          //     if (value != null && value.isEmpty) {
          //       return 'userId must not be empty';
          //     }
          //     return null;
          //   },
          //   onChanged: (value) => setState(() => userId = value),
          // ),
          SizedBox(height: 30,),
          Container(
            color: Colors.cyanAccent,
            height: 50,
            width: 150,
            child: ElevatedButton(
              onPressed: (){
                var post = Post(id:0,title: title,body: body,userId: 1);
                _apiPostCreate(post);
              },
              child: Text('Save'),
            ),
          )
        ],
      ),
    );
  }
}
