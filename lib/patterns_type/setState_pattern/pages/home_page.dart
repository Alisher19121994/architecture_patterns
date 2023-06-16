import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../model/post.dart';
import '../services/Network.dart';
import 'create.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static final String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isLoading = false;
  List<Post> items = [];

  @override
  void initState() {
    super.initState();
    _apiPostList();

  }

  void _apiPostList()async {
    setState(() {
      isLoading = true;
    });
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    setState(() {
      isLoading = false;
      if(response != null){
        items = Network.parsePostList(response);
      }else{
        items = [];
      }
    });
  }

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

  void _apiPostUpdate(Post post) {
    setState(() {
      isLoading = true;
    });
    var response = Network.PUT(Network.API_CREATE+post.id.toString(), Network.paramsUpdate(post));
    setState(() {
      isLoading = false;
      if(response != null){

      }else{
      }
    });
  }

  void _apiPostDelete(Post post)async {
    setState(() {
      isLoading = true;
    });
    var response = await Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    setState(() {
      if(response != null){
        _apiPostList();
      }else{
      }
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (context,index){
              return  _itemOfPost(items[index]);
            },
          ),
          isLoading ? const Center(
            child: CircularProgressIndicator(),
          ):const SizedBox.shrink(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyanAccent,
        foregroundColor:Colors.white,
        onPressed: (){
          Navigator.pushNamed(context, SetStateCreatePage.id);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
  Widget _itemOfPost(Post post){
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        // dismissible: DismissiblePane(
        //   onDismissed: (){},
        // ),
        children: [
          SlidableAction(
            onPressed: (context){
              var post1 = Post(id: 1, title: "PDP", body: "Online", userId: 1);
              _apiPostUpdate(post1);
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
              _apiPostDelete(post);
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
}
