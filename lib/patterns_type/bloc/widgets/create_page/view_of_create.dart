import 'package:architecture_patterns/patterns_type/bloc/model/posts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../bloc/create_page/post/cubit.dart';

Widget viewOfCreate(bool isLoading, BuildContext context,
    TextEditingController titleController,
    TextEditingController bodyController) {
  return Container(
    padding: EdgeInsets.all(30),
    child: Stack(
      children: [
        Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  hintText: "Title", hintStyle: TextStyle(color: Colors.grey)),
            ),
            TextField(
              controller: bodyController,
              decoration: InputDecoration(
                  hintText: "Body", hintStyle: TextStyle(color: Colors.grey)),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                PostBloc post = PostBloc(
                    title: titleController.text.toString(),
                    body: bodyController.text.toString(),
                    userId: 1, id: 1);
                BlocProvider.of<CreatePostCubit>(context).apiPostCreate(post);
              },
              child: Text(
                "Create a Post",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        isLoading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : SizedBox.shrink(),
      ],
    ),
  );
}