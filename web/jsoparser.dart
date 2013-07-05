import 'dart:html';
import 'package:web_ui/web_ui.dart';
import 'package:web_ui/observe/observable.dart';
import 'package:route/client.dart';
import 'package:jsoparser/urls.dart' as urls;
import 'package:jsoparser/views.dart' as views;

/**
 * Learn about the Web UI package by visiting
 * http://www.dartlang.org/articles/dart-web-components/.
 */
void main() {
  // Enable this to use Shadow DOM in the browser.
  //useShadowDom = true;
  var url = "/C:/Users/neoxp/dart/jsoparser/web/out/index.html";
  ['[.]+', '[.]+#search']
      .where((r) {
        var iter = new RegExp(r).allMatches(url).iterator;
        if (iter.moveNext()) {
          var match = iter.current;
          return (match.start == 0) && (match.end == url.length)
              && (!iter.moveNext());
        }
        return false;
       })
       .forEach((r) {
         print(r);
       });
}
