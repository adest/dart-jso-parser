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
}

class JsoModel {
  var jso;
  @observable String searchFilter = '';

  JsoModel() {
    jso = parse('{"toto":{"titi":5}, "tutu":[0,1,2,3,4,5,6,7,8,9]}');
  }

}