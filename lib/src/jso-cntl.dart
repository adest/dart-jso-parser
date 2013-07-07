part of controller;

class JsoCntl {
  void parse(String jso) {
    jsoModel.jso = json.parse(jso);
    router.gotoUrl(search, [], "");
  }

  bool matcheSearchFilter(String title, var value) {
    if (jsoModel.searchFilter.isEmpty) {
      return false;
    }

    return  (title.toLowerCase().contains(jsoModel.searchFilter.toLowerCase())) ||
            (value != null && (value is String || value is num)&&
                "$value".toLowerCase().contains(jsoModel.searchFilter.toLowerCase()));
  }
}