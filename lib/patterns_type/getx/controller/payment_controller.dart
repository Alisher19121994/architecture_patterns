import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/post_data.dart';
import '../services/services.dart';

class PaymentController extends GetxController{
  final Connectivity _connectivity = Connectivity();

  var isLoading = false;
  late String title;
  late String body;
  var items = [];
  String image = '';


  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }
  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      Get.rawSnackbar(
          messageText: const Text('PLEASE CONNECT TO THE INTERNET', style: TextStyle(color: Colors.black, fontSize: 14)),
          isDismissible: false,
          duration: const Duration(days: 1),
          backgroundColor: Colors.red[400]!,
          icon : const Icon(Icons.wifi_off, color: Colors.white, size: 35,),
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.GROUNDED
      );
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }

  void apiPostLists()async {
    isLoading = true;
    update();
    var response = await ServiceX.GETs();
    if(response != null){
      image = response;
    }else{
      items = [];
    }
    isLoading = false;
    update();
  }

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
    var response = ServiceX.POSTs(ServiceX.API_CREATE, ServiceX.paramsCreate(post));
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