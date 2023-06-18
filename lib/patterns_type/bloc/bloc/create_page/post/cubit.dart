import 'package:architecture_patterns/patterns_type/bloc/bloc/create_page/post/state.dart';
import 'package:architecture_patterns/patterns_type/bloc/model/posts.dart';
import 'package:architecture_patterns/patterns_type/bloc/services/network_service_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit() : super(CreatePostInit());

  void apiPostCreate(PostBloc postBloc) async {
    emit(CreatePostLoading());
    final response = await NetworkServiceBloc.POST(
        NetworkServiceBloc.API_CREATE,
        NetworkServiceBloc.paramsCreate(postBloc));
    if (response != null) {
      emit(CreatePostLoaded(isCreated: true));
    } else {
      emit(CreatePostError(error: "Couldn't create post"));
    }
  }
}
