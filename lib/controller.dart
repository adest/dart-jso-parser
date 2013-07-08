library controller;

import 'dart:json' as json;
import 'package:jsoparser/model.dart';
import 'package:jsoparser/bson_helper.dart';
import 'package:jsoparser/urls.dart';

JsoCntl jsoCntl = new JsoCntl();

class JsoCntl {
  void parse(String jso) {
    jsoModel.jso = json.parse(jso);
    String hexString = toHexString(jsoModel.jso);
    router.gotoUrl(search, [hexString], "");
  }

  bool matcheSearchFilter(String title, var value) {
    if (jsoModel.searchFilter.isEmpty) {
      return false;
    }

    return  (title.toLowerCase().contains(jsoModel.searchFilter.toLowerCase())) ||
            (value != null && (value is String || value is num)&&
                "$value".toLowerCase().contains(jsoModel.searchFilter.toLowerCase()));
  }
}