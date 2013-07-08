import 'dart:html';
import 'package:web_ui/web_ui.dart';
import 'package:jsoparser/controller.dart';

class Tree extends WebComponent {

  var jso;

  handleToggle(MouseEvent e) {
    assert(e != null);
    assert(e.fromElement != null);
    assert(e.fromElement is SpanElement);
    assert(e.fromElement.parent is LIElement);
    e.fromElement.parent.classes.toggle("open");
  }
}