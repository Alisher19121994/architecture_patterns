import 'package:get/get.dart';

import '../model/post_data.dart';
import '../services/services.dart';

class PaymentController extends GetxController{

  var isLoading = false;
  late String title;
  late String body;
  var items = [];

  void apiPostList()async {
    isLoading = true;
    update();
    var response = await ServiceX.GET(ServiceX.API_LIST, ServiceX.paramsEmpty());
    if(response != null){
      items = ServiceX.parsePostList(response);
    }else{
      items = [];
    }
    isLoading = false;
    update();
  }

  void apiPostCreate(PostX post) {
    isLoading = true;
    var response = ServiceX.POST(ServiceX.API_CREATE, ServiceX.paramsCreate(post));
    if(response != null){

    }else{
    }
    isLoading = false;
  }

  void apiPostUpdate(PostX post) {
    isLoading = true;
    var response = ServiceX.PUT(ServiceX.API_CREATE+post.id.toString(), ServiceX.paramsUpdate(post));
    if(response != null){

    }else{
    }
    isLoading = false;
  }

  void apiPostDelete(PostX post)async {
    isLoading = true;
    update();
    var response = await ServiceX.DEL(ServiceX.API_DELETE + post.id.toString(), ServiceX.paramsEmpty());
    if(response != null){
      apiPostList();
    }else{
    }
    isLoading = false;
    update();
  }

}