import 'package:dart_mappable/dart_mappable.dart';
part 'order.mapper.dart';

@MappableEnum()
enum Order {
  close,
  createWindow,
  closeWindow,
  changeConfig,
  changeWindowProperties,
}
