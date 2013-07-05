part of model;

class AppModel {
  String title = "JsoParser";
}

class JsoModel {
  var jso;
  @observable String searchFilter = '';

  JsoModel() {
    jso = parse('{"toto":{"titi":5}, "tutu":[0,1,2,3,4,5,6,7,8,9]}');
  }

}