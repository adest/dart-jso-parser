library x_view_search;

import 'dart:html';
import 'package:web_ui/web_ui.dart';
import 'package:jsoparser/urls.dart';
import 'package:jsoparser/model.dart';

class ViewSearch extends WebComponent {
  InputElement _search;
  var _errors = toObservable([]);

  inserted() {
    var root = shadowRoot != null? shadowRoot: this;
    _search = root.query("header > section.search > form.form-search > input.search-query");
    _search.focus();
  }

  handleBack() {
    router.gotoPath(homeUrl.reverse([], useFragment: true), "");
  }
}