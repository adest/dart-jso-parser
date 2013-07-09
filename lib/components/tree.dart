import 'dart:html';
import 'package:web_ui/web_ui.dart';
import 'package:jsoparser/controller.dart';

class Tree extends WebComponent {

  var jso;

  handleToggle(MouseEvent e) {
    assert(e != null);
    assert(e.toElement != null);
    assert(e.toElement is SpanElement);
    assert(e.toElement.parent is LIElement);
    e.toElement.parent.classes.toggle("open");
  }
}