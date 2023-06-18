import 'package:architecture_patterns/patterns_type/bloc/bloc/create_page/post/cubit.dart';
import 'package:architecture_patterns/patterns_type/bloc/bloc/create_page/post/state.dart';
import 'package:architecture_patterns/patterns_type/bloc/widgets/create_page/view_of_create.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBlocPage extends StatefulWidget {
  const PostBlocPage({super.key});
  static const String id = 'iddbloc';
  @override
  State<PostBlocPage> createState() => _PostBlocPageState();
}

class _PostBlocPageState extends State<PostBlocPage> {

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  _finish(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context, "result");
    });
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>CreatePostCubit(),
      child: Scaffold(
        body: BlocBuilder<CreatePostCubit,CreatePostState>(
          builder: (BuildContext context, CreatePostState state) {
            if(state is CreatePostLoading){
              return viewOfCreate(true, context, titleController, bodyController);
            }
            if(state is CreatePostLoaded){
              _finish(context);
            }
            if(state is CreatePostError){}
              return viewOfCreate(false, context, titleController, bodyController);
          },
        ),
      ),
    );
  }
}
