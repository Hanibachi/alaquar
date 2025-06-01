// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'order.dart';

class OrderMapper extends EnumMapper<Order> {
  OrderMapper._();

  static OrderMapper? _instance;
  static OrderMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OrderMapper._());
    }
    return _instance!;
  }

  static Order fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Order decode(dynamic value) {
    switch (value) {
      case r'close':
        return Order.close;
      case r'createWindow':
        return Order.createWindow;
      case r'closeWindow':
        return Order.closeWindow;
      case r'changeConfig':
        return Order.changeConfig;
      case r'changeWindowProperties':
        return Order.changeWindowProperties;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Order self) {
    switch (self) {
      case Order.close:
        return r'close';
      case Order.createWindow:
        return r'createWindow';
      case Order.closeWindow:
        return r'closeWindow';
      case Order.changeConfig:
        return r'changeConfig';
      case Order.changeWindowProperties:
        return r'changeWindowProperties';
    }
  }
}

extension OrderMapperExtension on Order {
  String toValue() {
    OrderMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Order>(this) as String;
  }
}
