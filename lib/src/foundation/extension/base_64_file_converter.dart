import 'dart:convert';
import 'dart:io';

extension FilefileBase64Converter on File {
  String toBase64String() {
    final List<int> bytes = readAsBytesSync();
    final base64String = base64Encode(bytes);
    return base64String;
  }
}
