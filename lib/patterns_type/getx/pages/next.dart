import 'package:architecture_patterns/patterns_type/getx/controller/main_controller.dart';
import 'package:architecture_patterns/patterns_type/getx/model/post_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class GetXPage extends StatefulWidget {
  const GetXPage({super.key});

  static const String id = 'ids';
  @override
  State<GetXPage> createState() => _GetXPageState();
}

class _GetXPageState extends State<GetXPage> {

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
            onChanged: (value) => setState(() => Get.find<MainController>().title = value),
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
            onChanged: (value) => setState(() => Get.find<MainController>().body = value),),
          SizedBox(height: 10,),
          SizedBox(height: 30,),
          Container(
            color: Colors.cyanAccent,
            height: 50,
            width: 150,
            child: ElevatedButton(
              onPressed: (){
                var post = PostX(id:0,title: Get.find<MainController>().title,
                    body: Get.find<MainController>().body,userId: 1);
                Get.find<MainController>().apiPostCreate(post);
              },
              child: Text('Save'),
            ),
          )
        ],
      )
    );
  }
}
