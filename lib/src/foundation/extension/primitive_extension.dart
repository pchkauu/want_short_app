extension StringQuery on String {
  Map<String, String> splitQueryString() {
    return split('&').fold({}, (map, element) {
      final index = element.indexOf('=');
      if (index == -1) {
        if (element != '') {
          map[element] = '';
        }
      } else if (index != 0) {
        final key = element.substring(0, index);
        final value = element.substring(index + 1);
        map[key] = value;
      }
      return map;
    });
  }
}

extension UnixFormat on int {
  DateTime toDateTime() {
    return DateTime.fromMillisecondsSinceEpoch(this * 1000);
  }
}
