import 'package:architecture_patterns/patterns_type/bloc/bloc/update_page/put/cubit.dart';
import 'package:architecture_patterns/patterns_type/bloc/model/posts.dart';
import 'package:architecture_patterns/patterns_type/bloc/widgets/update_page/view_of_update.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../bloc/update_page/put/state.dart';

class UpdateBlocPage extends StatefulWidget {
  PostBloc? post;

  UpdateBlocPage({super.key, this.post});

  static const String id = 'updatebloc';

  @override
  State<UpdateBlocPage> createState() => _UpdateBlocPageState();
}

class _UpdateBlocPageState extends State<UpdateBlocPage> {

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  _finish(BuildContext context) {SchedulerBinding.instance.addPostFrameCallback((_) {Navigator.pop(context, "result");});}

  @override
  void initState() {
    super.initState();
    titleController.text = widget.post!.title;
    bodyController.text = widget.post!.body;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UpdatePostCubit(),
        child: Scaffold(
          body: BlocBuilder<UpdatePostCubit, UpdatePostState>(
            builder: (BuildContext context, UpdatePostState state) {
              if (state is UpdatePostLoading) {
                String title = titleController.text.toString();
                String body = bodyController.text.toString();

                PostBloc postBloc = PostBloc(id:widget.post!.id, title: title, body: body, userId: widget.post!.userId);
                return viewOfUpdate(true, context, postBloc, titleController, bodyController);
              }
              if(state is UpdatePostLoaded){
                _finish(context);
              }
              if(state is UpdatePostError){}
              return viewOfUpdate(false, context, widget.post!, titleController, bodyController);
            },
          ),
        ));
  }
}
