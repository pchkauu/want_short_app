import 'package:path/path.dart' as path;

extension FileString on String {
  String? get fileExtension {
    final extension = path.extension(this);
    return extension.isEmpty ? null : extension.substring(1);
  }
}
