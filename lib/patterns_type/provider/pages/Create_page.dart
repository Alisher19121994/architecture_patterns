import 'package:flutter/material.dart';

import '../model/post.dart';
import '../viewModel/home_view_model.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});
  static final String id = 'CreatePage';
  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  HomeViewModel  viewModel = HomeViewModel();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
            onChanged: (value) => setState(() => viewModel.title = value),
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
            onChanged: (value) => setState(() => viewModel.body = value),
          ),
          SizedBox(height: 10,),
          SizedBox(height: 30,),
          Container(
            color: Colors.cyanAccent,
            height: 50,
            width: 150,
            child: ElevatedButton(
              onPressed: (){
                var post = Posts(id:0,title: viewModel.title,body: viewModel.body,userId: 1);
                viewModel.apiPostCreate(post);
              },
              child: Text('Save'),
            ),
          )
        ],
      ),
    );
  }
}
