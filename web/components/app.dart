import 'dart:html';
import 'package:web_ui/web_ui.dart';
import 'package:route/url_pattern.dart';
import 'package:jsoparser/model.dart';
import 'package:jsoparser/urls.dart' as urls;
import 'package:jsoparser/views.dart' as views;


class JsoApp extends WebComponent {
  String title;

  JsoApp() {
    _initRooting();
  }

  _initRooting() {
    // order have sens since homeUrl = r'(.*)'

    urls.router
      ..addHandler(urls.homeUrl,    (path) => views.showInput())
      ..addHandler(urls.searchUrl,  (path) => views.showSearch())

      ..listen(ignoreClick: false);

  }
}