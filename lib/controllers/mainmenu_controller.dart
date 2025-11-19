import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_17/fragments/bookmarks_fragments.dart';
import 'package:pas_mobile_11pplg2_17/fragments/table_fragments.dart';
import 'package:pas_mobile_11pplg2_17/fragments/profile_fragments.dart';

class MainmenuController extends GetxController{

  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    TableFragments(),
    BookFragment(), 
    ProfileFragment(),
  ];

  void changePage(int index){
    selectedIndex.value = index;
  }

}