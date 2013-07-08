library urls;

import 'dart:html';
import 'package:route/client.dart';
import 'package:jsoparser/model.dart';
import 'package:jsoparser/bson_helper.dart';

final String _pathName = window.location.pathname;

final UrlPattern _base = new UrlPattern("${_pathName}");
final UrlPattern home = new UrlPattern("${_pathName}#home");
final UrlPattern searchEmpty = new UrlPattern("${_pathName}#search");
final UrlPattern search = new UrlPattern("${_pathName}#search/(.+)");

// useFragment: true is important! allow keep '#" un url
// allow to bookmark be valid when browser is closed and reopen.
final Router router = new Router(useFragment: true)
        ..addHandler(_base, (_) => window.location.hash = "#home")
        ..addHandler(home, (_) => appModel.currentView = ViewEnum.INPUT)
        ..addHandler(searchEmpty, (_) => appModel.currentView = ViewEnum.SEARCH)
        ..addHandler(search, (_) {
                String hexString = search.parse(_).first;
                jsoModel.jso = fromHexString(hexString);
                appModel.currentView = ViewEnum.SEARCH; });
