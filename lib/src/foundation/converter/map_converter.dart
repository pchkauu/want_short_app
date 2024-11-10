// ignore: avoid_annotating_with_dynamic
MapEntry<String, String> convertToMapStringString(String key, dynamic value) {
  return MapEntry(key, value.toString());
}

// ignore: avoid_annotating_with_dynamic
MapEntry<String, int> convertToMapStringInt(String key, dynamic value) {
  return MapEntry(key, int.tryParse(value.toString()) ?? 0);
}
