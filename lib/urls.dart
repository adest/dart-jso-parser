library urls;

import 'dart:html';
import 'package:route/client.dart';
import 'package:jsoparser/views.dart' as views;

final _path = '${window.location.pathname}';
final homeUrl = new UrlPattern(_path);
final searchUrl = new UrlPattern('${_path}#search');


final router = new Router();