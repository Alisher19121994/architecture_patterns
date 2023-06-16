import 'package:get/get.dart';

import '../model/post_data.dart';
import '../services/services.dart';

class MainController extends GetxController{

  var isLoading = false.obs;
  var items = [].obs;

  void apiPostList()async {
    isLoading.value = true;
    var response = await ServiceX.GET(ServiceX.API_LIST, ServiceX.paramsEmpty());
    if(response != null){
      items.value = ServiceX.parsePostList(response);
    }else{
      items.value = [];
    }
    isLoading.value = false;
  }

  void apiPostCreate(PostX post) {
    isLoading.value = true;
    var response = ServiceX.POST(ServiceX.API_CREATE, ServiceX.paramsCreate(post));
    if(response != null){

    }else{
    }
    isLoading.value = false;
  }

  void apiPostUpdate(PostX post) {
    isLoading.value = true;
    var response = ServiceX.PUT(ServiceX.API_CREATE+post.id.toString(), ServiceX.paramsUpdate(post));
    if(response != null){

    }else{
    }
    isLoading.value = false;
  }

  void apiPostDelete(PostX post)async {
    isLoading.value = true;
    var response = await ServiceX.DEL(ServiceX.API_DELETE + post.id.toString(), ServiceX.paramsEmpty());
    if(response != null){
      apiPostList();
    }else{
    }
    isLoading.value = false;
  }

}