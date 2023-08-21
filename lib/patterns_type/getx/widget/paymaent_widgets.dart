import 'package:architecture_patterns/patterns_type/getx/controller/home_controller.dart';
import 'package:architecture_patterns/patterns_type/getx/controller/main_controller.dart';
import 'package:architecture_patterns/patterns_type/getx/controller/payment_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../model/post_data.dart';

Widget itemOfPaymentPost(PaymentController mainController,PostX post){
  return Slidable(
    startActionPane: ActionPane(
      motion: const ScrollMotion(),
      // dismissible: DismissiblePane(
      //   onDismissed: (){},
      // ),
      children: [
        SlidableAction(
          onPressed: (context){
            var post1 = PostX(id: 1, title: "PDP", body: "Online", userId: 1);
            mainController.apiPostUpdate(post1);
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
            mainController.apiPostDelete(post);
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
      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     const SizedBox(height: 5,),
      //
      //
      //   ],
      // ),
      child: ListTile(
        leading:CachedNetworkImage(
          imageUrl: "https://thumbs.dreamstime.com/b/big-ben-london-autumn-leaves-32915756.jpg",
          //imageUrl: mainController.image,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        title:   Text(post.title.toLowerCase()),
        subtitle: Text(post.body),
      ),
    ),
  );
}