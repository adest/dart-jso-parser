library urls;

import 'dart:html';
import 'package:route/client.dart';
import 'package:jsoparser/model.dart';

final String _pathName = window.location.pathname;

final UrlPattern _base = new UrlPattern("${_pathName}");
final UrlPattern home = new UrlPattern("${_pathName}#home");
final UrlPattern search = new UrlPattern("${_pathName}#search");

// useFragment: true is important! allow keep '#" un url
// allow to bookmark be valid when browser is closed and reopen.
final Router router = new Router(useFragment: true)
        ..addHandler(_base, (_) => window.location.hash = "#home")
        ..addHandler(home, (_) => appModel.currentView = ViewEnum.INPUT)
        ..addHandler(search, (_) => appModel.currentView = ViewEnum.SEARCH);

/*main() {
  router..addHandler(home, showHome)
        ..addHandler(search, showPage2)
        ..listen();
}

void showHome(String path) {
  query("body").children
          ..clear()
          ..add(new Element.html("<h1>Home</H1>"));
}

void showPage2(String path) {
  query("body").children
          ..clear()
          ..add(new Element.html("<h1>Page2</H1>"));
}*/