import 'dart:io';

extension FileSystemEntityFromPathExtension on String {
  File toFile() => File(this);
  Directory toDirectory() => Directory(this);
}
