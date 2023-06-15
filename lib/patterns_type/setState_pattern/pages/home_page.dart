import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../model/post.dart';
import '../services/Network.dart';

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
    var post = Post(id: 1, title: "PDP", body: "Online", userId: 1);
    _apiPostDelete(post);
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
    Network.POST(Network.API_CREATE, Network.paramsCreate(post))
        .then((response) => {
              print(response),

            });
  }

  void _apiPostUpdate(Post post) {
    Network.PUT(
            Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post))
        .then((response) => {
              print(response),

            });
  }

  void _apiPostDelete(Post post)async {
    setState(() {
      isLoading = true;
    });
    var response = await Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    setState(() {
      isLoading = false;
      if(response != null){
        _apiPostList();
      }else{
      }
    });
  }

  // void _showResponse(String response) {
  //   setState(() {
  //     data = response;
  //   });
  // }

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
        onPressed: (){},
        child: const Icon(Icons.add),
      ),
    );
  }
  Widget _itemOfPost(Post post){
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: (){},
        ),
        children: [
          SlidableAction(
            onPressed: (context){},
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Update',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: (){},
        ),
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
