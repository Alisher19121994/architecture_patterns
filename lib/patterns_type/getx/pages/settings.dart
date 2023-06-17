import 'package:architecture_patterns/patterns_type/getx/controller/home_controller.dart';
import 'package:architecture_patterns/patterns_type/getx/controller/main_controller.dart';
import 'package:architecture_patterns/patterns_type/getx/controller/settings_controller.dart';
import 'package:architecture_patterns/patterns_type/getx/model/post_data.dart';
import 'package:architecture_patterns/patterns_type/getx/pages/next.dart';
import 'package:architecture_patterns/patterns_type/provider/viewModel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';

import '../../provider/widgets/item_of_posts.dart';
import '../../setState_pattern/services/Network.dart';
import '../services/services.dart';
import '../widget/main_widgets.dart';
import '../widget/widgets.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  static const String id = 'idd';
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  void initState() {
    super.initState();
    Get.find<MainController>().apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<SettingsController>(
        init: SettingsController(),
        builder: (_controller){
          return Stack(
            children: [
              ListView.builder(
                itemCount:Get.find<MainController>().items.length,
                itemBuilder: (context,index){
                  return itemOfMainPost(Get.find<MainController>(),Get.find<MainController>().items[index]);
                },
              ),
              Get.find<MainController>().isLoading.value ? const Center(
                child: CircularProgressIndicator(),
              ):const SizedBox.shrink(),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyanAccent,
        foregroundColor:Colors.white,
        onPressed: (){
     //     Navigator.pushNamed(context, GetXPage.id);
          Get.to(GetXPage);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

