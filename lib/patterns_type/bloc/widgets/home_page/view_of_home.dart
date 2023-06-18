import 'package:architecture_patterns/patterns_type/bloc/model/posts.dart';
import 'package:flutter/material.dart';
import 'item_of_post.dart';

Widget viewOfHome(List<PostBloc> items, bool isLoading) {
  return Stack(
    children: [
      ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, index) {
          return itemOfPost(ctx, items[index]);
        },
      ),
      isLoading
          ? Center(
           child: CircularProgressIndicator(),
      )
          : SizedBox.shrink(),
    ],
  );
}