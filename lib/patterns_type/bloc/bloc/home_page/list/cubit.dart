import 'package:architecture_patterns/patterns_type/bloc/model/posts.dart';
import 'package:architecture_patterns/patterns_type/bloc/pages/post_page.dart';
import 'package:architecture_patterns/patterns_type/bloc/services/network_service_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../pages/update_page.dart';
import 'state.dart';

class ListPostCubit extends Cubit<ListPostState> {
  ListPostCubit() : super(ListPostInit());

  //List
  void apiPostList() async {
    emit(ListPostLoading());
    final response = await NetworkServiceBloc.GET(
        NetworkServiceBloc.API_LIST, NetworkServiceBloc.paramsEmpty());
    if (response != null) {
      emit(ListPostLoaded(posts: NetworkServiceBloc.parsePostList(response)));
    } else {
      emit(ListPostError(error: 'Could not loaded!'));
    }
  }

  //Delete
  void apiPostDelete(PostBloc postBloc) async {
    emit(ListPostLoading());
    final response = await NetworkServiceBloc.DEL(
        NetworkServiceBloc.API_DELETE + postBloc.id.toString(),
        NetworkServiceBloc.paramsEmpty());
    if (response != null) {
      apiPostList();
    } else {
      emit(ListPostError(error: 'Could not deleted!'));
    }
  }

  void callCreatePage(context) async {
    var results = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const PostBlocPage()));
    if (results != null) {
      BlocProvider.of<ListPostCubit>(context).apiPostList();
    }
  }

  void callUpdatePage(context, PostBloc post) async {
    print(post.toJson());
    var results = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => UpdateBlocPage(post: post)));
    if (results != null) {
      BlocProvider.of<ListPostCubit>(context).apiPostList();
    }
  }
}
