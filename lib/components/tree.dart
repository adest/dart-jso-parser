import 'dart:html';
import 'package:web_ui/web_ui.dart';
import 'tree-item.dart';

class Tree extends WebComponent {

  var jso;

  inserted() {
    _buildUI();
  }

  void _buildUI() {
    bool isMap = jso is Map;
    bool isList = jso is List;

    if (jso != null && (isMap || isList)) {
      jso.forEach(
          (var key, [var value = null])
              => _injectItem(key, value, isList));
    }
  }

  void _injectItem(var key, var jso, bool isAnArray) {
    TreeItem item = new TreeItem()
      ..host = new Element.html('<li is="x-tree-item"></li>');
    item  ..title = "$key"
          ..value = jso
          ..isAnArray = isAnArray;
    ComponentItem lifecycleCaller = new ComponentItem(item)..create();
    host.children.add(item.host);
    lifecycleCaller.insert();
  }
}