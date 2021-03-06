part of model;

class ViewEnum {
  final _value;
  const ViewEnum._internal(this._value);
  toString() => 'ViewEnum.$_value';

  static const INPUT = const ViewEnum._internal('viewInput');
  static const SEARCH = const ViewEnum._internal('viewSearch');
}

class AppModel {
  String title = "JsoParser";
  @observable ViewEnum currentView = ViewEnum.INPUT;
  @observable String get animationClass
          => currentView == ViewEnum.SEARCH? 'r2l': 'l2r';
}

class JsoModel {
  var jso;
  @observable String searchFilter = '';

  JsoModel() {
    jso = parse('{"field1":{"field2":5}, "field3":[0,1,2,3,4,5,6,7,8,9]}');
  }

}