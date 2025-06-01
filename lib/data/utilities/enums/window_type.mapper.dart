// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'window_type.dart';

class WindowTypeMapper extends EnumMapper<WindowType> {
  WindowTypeMapper._();

  static WindowTypeMapper? _instance;
  static WindowTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WindowTypeMapper._());
    }
    return _instance!;
  }

  static WindowType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  WindowType decode(dynamic value) {
    switch (value) {
      case r'main':
        return WindowType.main;
      case r'background':
        return WindowType.background;
      case r'idle':
        return WindowType.idle;
      case r'bar':
        return WindowType.bar;
      case r'notification':
        return WindowType.notification;
      case r'notificationCenter':
        return WindowType.notificationCenter;
      case r'launcher':
        return WindowType.launcher;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(WindowType self) {
    switch (self) {
      case WindowType.main:
        return r'main';
      case WindowType.background:
        return r'background';
      case WindowType.idle:
        return r'idle';
      case WindowType.bar:
        return r'bar';
      case WindowType.notification:
        return r'notification';
      case WindowType.notificationCenter:
        return r'notificationCenter';
      case WindowType.launcher:
        return r'launcher';
    }
  }
}

extension WindowTypeMapperExtension on WindowType {
  String toValue() {
    WindowTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<WindowType>(this) as String;
  }
}
