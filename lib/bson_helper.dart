library bson_helper;

import 'package:bson/bson.dart';

var _bson = new BSON();

String toHexString(var jso) {
  var buffer = _bson.serialize(jso);
  return buffer.hexString;
}

fromHexString(String hexString) {
  var buffer = new BsonBinary.fromHexString(hexString);
  buffer.makeByteList();
  buffer.offset = 0;
  return _bson.deserialize(buffer);
}