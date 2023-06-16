import 'package:flutter/cupertino.dart';

import '../model/post.dart';
import '../services/services.dart';

class HomeViewModel extends ChangeNotifier{
  var isLoading = false;
  late String title;
  late String body;
  List<Posts> items = [];

  Future apiPostList()async {
    isLoading = true;
    notifyListeners();
    var response = await Services.GET(Services.API_LIST, Services.paramsEmpty());

    if(response != null){
      items = Services.parsePostList(response);
    }else{
      items = [];
    }
    isLoading = false;
    notifyListeners();
  }

  bool apiPostCreate(Posts post) {
    isLoading = true;
    notifyListeners();
    var response = Services.POST(Services.API_CREATE, Services.paramsCreate(post));
    isLoading = false;
    notifyListeners();
    return response != null;
  }

  bool apiPostUpdate(Posts post) {
    isLoading = true;
    notifyListeners();
    var response = Services.PUT(Services.API_CREATE+post.id.toString(), Services.paramsUpdate(post));
    isLoading = false;
    notifyListeners();
    return response != null;
  }

  Future<bool?> apiPostDelete(Posts post)async {
    isLoading = true;
    notifyListeners();
    var response = await Services.DEL(Services.API_DELETE + post.id.toString(), Services.paramsEmpty());
    isLoading = false;
    notifyListeners();
    return response != null;
  }
}