library x_view_search;

import 'dart:html';
import 'package:web_ui/web_ui.dart';
import 'package:jsoparser/model.dart';

class ViewSearch extends WebComponent {
  InputElement _search;
  var _errors = toObservable([]);

  inserted() {
    var root = shadowRoot != null? shadowRoot: this;
    _search = root.query("header > section.search > input.search-query");
    _search.focus();
  }

  handleBack() {
    appModel.currentView = ViewEnum.INPUT;
  }
}