library views;

import 'dart:html';
import 'package:web_ui/web_ui.dart';
import 'package:jsoparser/components/view-input.dart';
import 'package:jsoparser/components/view-search.dart';

class Model {
  final Element view = query("[view]") as Element;
  ComponentItem lifecycleCaller;

  void removeCurrentView() {
    if (lifecycleCaller != null) {
      lifecycleCaller.remove();
      if (view != null) {
        view.children.clear();
      }
    }
  }
}
var _model = new Model();

void _injectView(Element parent, var webComponent) {
  assert(webComponent != null);
  assert(webComponent.host != null);
  if (parent == null) {
    parent = document.body;
  }

  _model.lifecycleCaller = new ComponentItem(webComponent)..create();
  parent.children.add(webComponent.host);
  _model.lifecycleCaller.insert();
}

void showInput() {
  _model.removeCurrentView();
  var compo = new ViewInput();
  compo.host = new Element.html("<div is='view-input'></div>");
  _injectView(_model.view, compo);
}

void showSearch() {
  _model.removeCurrentView();
  var compo = new ViewSearch();
  compo.host = new Element.html("<div is='view-search'></div>");
  _injectView(_model.view, compo);

}
