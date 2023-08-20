import 'package:architecture_patterns/patterns_type/bloc/bloc/home_page/list/state.dart';
import 'package:architecture_patterns/patterns_type/bloc/model/posts.dart';
import 'package:architecture_patterns/patterns_type/bloc/widgets/home_page/view_of_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_page/list/cubit.dart';

class HomeBloc extends StatefulWidget {
  const HomeBloc({super.key});
static const String id = 'iddd';
  @override
  State<HomeBloc> createState() => _HomeBlocState();
}

class _HomeBlocState extends State<HomeBloc> {

  List<PostBloc> items = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListPostCubit>(context).apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ListPostCubit, ListPostState>(
        builder: (BuildContext context, ListPostState state){

          if(state is ListPostError){
            return viewOfHome(items, true);
          }
          if(state is ListPostLoaded){
            items = state.posts!;
            return viewOfHome(items, false);
          }
         return viewOfHome(items, true);
        },
      ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            BlocProvider.of<ListPostCubit>(context).callCreatePage(context);
          },
          child: const Icon(Icons.add),
        )
    );
  }
}
