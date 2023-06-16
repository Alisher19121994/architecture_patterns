import 'dart:developer';

import 'package:architecture_patterns/patterns_type/introduction/service/service.dart';
import 'package:flutter/material.dart';

import 'model/account.dart';

class Homes extends StatefulWidget {
  const Homes({super.key});
static const String id = 'home';
  @override
  State<Homes> createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  var isLoading = false;
  List<Account> listOfItems =[];

  @override
  void initState() {
    super.initState();
    _apiPostList();

  }
  void _apiPostList()async {
    setState(() {
      isLoading = true;
    });
    var response = await ServiceData.GETs(ServiceData.API_LIST, ServiceData.paramsEmpty());
    setState(() {
      isLoading = false;
      if(response != null){
        listOfItems = ServiceData.parsePostList(response);
      }else{
        listOfItems = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemCount: listOfItems.length,
            itemBuilder: (context,index){
              return Card(
                color: Colors.cyanAccent,
                child: ListTile(
                  leading: Text(listOfItems[index].name??''),
                  //leading: CircleAvatar(radius: 50,backgroundImage: NetworkImage(listOfItems[index].avatarUrl??''),),
                  title: Text(listOfItems[index].name??''),
                  subtitle: Text(listOfItems[index].createdAt??''),
                ),
              );
            },
          ),
          isLoading ? const Center(child: CircularProgressIndicator(),):const SizedBox.shrink(),
        ],
      ),
    );
  }
}
