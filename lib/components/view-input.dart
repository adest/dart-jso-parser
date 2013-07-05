library x_view_input;

import 'dart:html';
import 'dart:json';
import 'package:web_ui/web_ui.dart';
import 'package:jsoparser/model.dart';
import 'package:jsoparser/controller.dart';


class ViewInput extends WebComponent {
  String get jsoString
      => _textarea.value;
  TextAreaElement _textarea;
  Element _enterInfo;
  var _errors = toObservable([]);

  inserted() {
    var root = shadowRoot != null? shadowRoot: this;
    _enterInfo = root.query("section.content > h2");
    _textarea = root.query("section.content > form > textarea");
    _textarea.text = stringify(jsoModel.jso);
    _handleTextareaValueChange();
    _textarea.focus();
  }

  void _handleTextareaKeyPress(KeyboardEvent event) {
    assert(event != null);
    switch (event.keyCode) {
      case KeyCode.ENTER:
        if (!event.shiftKey) {
          event.preventDefault();
          try {
            jsoCntl.parse(_textarea.value);
          } catch(e) {
            _errors.add(e);
          }
        }
        break;
    }
  }

  void _handleTextareaValueChange() {
    if (jsoString != null && jsoString.length > 0) {
      _enterInfo.classes.remove("hidden");
    } else {
      _enterInfo.classes.add("hidden");
    }
  }

  void _noBlurHandler() {
    _textarea.focus();
  }
}