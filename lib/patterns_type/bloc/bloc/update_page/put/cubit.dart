import 'package:architecture_patterns/patterns_type/bloc/bloc/update_page/put/state.dart';
import 'package:architecture_patterns/patterns_type/bloc/model/posts.dart';
import 'package:architecture_patterns/patterns_type/bloc/services/network_service_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdatePostCubit extends Cubit<UpdatePostState> {
  UpdatePostCubit() : super(UpdatePostInit());

  void apiPostUpdate(PostBloc postBloc) async {
    postBloc.userId = 1;
    emit(UpdatePostLoading());
    final response = await NetworkServiceBloc.PUT(NetworkServiceBloc.API_UPDATE,
        NetworkServiceBloc.paramsUpdate(postBloc));
    if (response != null) {
      emit(UpdatePostLoaded(isUpdated: true));
    } else {
      emit(UpdatePostError(error: "Couldn't update post"));
    }
  }
}
