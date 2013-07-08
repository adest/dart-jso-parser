library bson_help_test;

import 'package:unittest/unittest.dart';
import 'package:jsoparser/bson_helper.dart';

var _payload = {'field1':[0,1,2,3,4,5,6,7,8,9]};
var _hexString = "58000000046669656c6431004b000000103000000000001031000100000010320002000000103300030000001034000400000010350005000000103600060000001037000700000010380008000000103900090000000000";

main() {
  test("serialize and deserialize jso to bson", () {
    String hex = toHexString(_payload);
    expect(hex, equals(_hexString));

    var jso = fromHexString(hex);
    expect(jso, equals(_payload));
  });
}