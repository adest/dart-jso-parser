import 'dart:html';
import 'package:web_ui/web_ui.dart';
import 'package:logging_handlers/logging_handlers_shared.dart';
import 'package:jsoparser/urls.dart';

/**
 * Learn about the Web UI package by visiting
 * http://www.dartlang.org/articles/dart-web-components/.
 */
void main() {
  // Enable this to use Shadow DOM in the browser.
  //useShadowDom = true;
  startQuickLogging();
  router.listen();
}
