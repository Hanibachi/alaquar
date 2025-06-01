import 'package:dart_mappable/dart_mappable.dart';
part 'window_type.mapper.dart';

@MappableEnum()
enum WindowType {
  main,
  background,
  idle,
  bar,
  notification,
  notificationCenter,
  launcher,
}
