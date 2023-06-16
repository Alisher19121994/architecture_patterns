import 'package:architecture_patterns/patterns_type/provider/viewModel/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../model/post.dart';

Widget itemOfPost(HomeViewModel viewModel,Posts post){
  return Slidable(
    startActionPane: ActionPane(
      motion: const ScrollMotion(),
      // dismissible: DismissiblePane(
      //   onDismissed: (){},
      // ),
      children: [
        SlidableAction(
          onPressed: (context){
            var post1 = Posts(id: 1, title: "PDP", body: "Online", userId: 1);
            viewModel.apiPostUpdate(post1);
          },
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: 'Update',
        ),
      ],
    ),
    endActionPane: ActionPane(
      motion: const ScrollMotion(),
      // dismissible: DismissiblePane(
      //   onDismissed: (){},
      // ),
      children: [
        SlidableAction(
          onPressed: (context){
            viewModel.apiPostDelete(post).then((value) => {
              if(value != null) viewModel.apiPostList(),
            });
          },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: 'Delete',
        ),
      ],
    ),
    child: Container(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(post.title.toLowerCase()),
          const SizedBox(height: 5,),
          Text(post.body),
        ],
      ),
    ),
  );
}