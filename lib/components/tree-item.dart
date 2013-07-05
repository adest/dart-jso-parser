import 'dart:html';
import 'package:web_ui/web_ui.dart';
import 'package:jsoparser/model.dart';
import 'package:jsoparser/controller.dart';
import 'tree.dart';

class TreeItem extends WebComponent {

  @observable bool opened = true;
  bool isAnArray = false;
  String title;
  var value;

  bool get _isLeaf => isAnArray ||
                      value == null ||
                      value is String ||
                      value is num;
  String get _isLeafStyle => _isLeaf? "is-leaf": "";
  String get _separator => isAnArray? ", ": ": ";
  var _registration;

  inserted() {
    // observers
    _registration = observe(()=> opened, _handleOpenChange);
    _handleOpenChange(null);

    //html injection
    if (!isAnArray && value == null) {
      _injectBeforFoundTag(new SpanElement()
          ..text = "null");
    }
    else if (value is Map || value is List) {
      _injectSubTree(value);
    }
    else if (value is String || value is num) {
      _injectBeforFoundTag(new SpanElement()
          ..classes.add("body")
          ..text = "$value");
    }
  }

  removed() {
    _registration();
  }

  void _handleTitleClick(Event e) {
    e.preventDefault();
    opened = !opened;
  }

  void _handleOpenChange(e) {
    host.classes
        ..add(opened? "opened": "closed")
        ..remove(!opened? "opened": "closed");
  }

  void _injectSubTree(var jso) {
    Tree subTree = new Tree()
      ..host = new Element.html('<ul is="x-tree"></ul>')
      ..jso = jso;
    ComponentItem lifecycleCaller = new ComponentItem(subTree)..create();
    host.children.add(subTree.host); // here we volontary not use _injectBeforFoundTag
    lifecycleCaller.insert();
  }

  void _injectBeforFoundTag(Element e)
        => host.children.insert(
              host.children.length - 1,
              e);
}