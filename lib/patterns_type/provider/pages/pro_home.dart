import 'package:architecture_patterns/patterns_type/provider/model/post.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewModel/home_view_model.dart';
import '../widgets/item_of_posts.dart';
import 'Create_page.dart';

class PROHOME extends StatefulWidget {
  const PROHOME({super.key});
  static final String id = 'PROHOME';
  @override
  State<PROHOME> createState() => _PROHOMEState();
}

class _PROHOMEState extends State<PROHOME> {

  HomeViewModel  viewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<HomeViewModel>(
          builder: (context,model,index) =>Stack(
            children: [
              ListView.builder(
                itemCount: viewModel.items.length,
                itemBuilder: (context,index){
                  Posts posts = viewModel.items[index];
                  return itemOfPost(viewModel,posts);
                },
              ),
              viewModel.isLoading ? const Center(
                child: CircularProgressIndicator(),
              ):const SizedBox.shrink(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyanAccent,
        foregroundColor:Colors.white,
        onPressed: (){
          Navigator.pushNamed(context, CreatePage.id);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
