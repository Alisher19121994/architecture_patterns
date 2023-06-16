import 'package:flutter/material.dart';

import '../model/post.dart';
import '../viewModel/home_view_model.dart';

class ProviderCreatePage extends StatefulWidget {
  const ProviderCreatePage({super.key});
  static final String id = 'CreatePage';
  @override
  State<ProviderCreatePage> createState() => _ProviderCreatePageState();
}

class _ProviderCreatePageState extends State<ProviderCreatePage> {

  HomeViewModel  viewModel = HomeViewModel();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20,right: 20,top: 20),
        child: Column(
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
      ),
    );
  }
}
