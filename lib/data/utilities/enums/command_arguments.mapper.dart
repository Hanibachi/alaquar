// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'command_arguments.dart';

class CommandArgumentMapper extends EnumMapper<CommandArgument> {
  CommandArgumentMapper._();

  static CommandArgumentMapper? _instance;
  static CommandArgumentMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CommandArgumentMapper._());
    }
    return _instance!;
  }

  static CommandArgument fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  CommandArgument decode(dynamic value) {
    switch (value) {
      case r'windowId':
        return CommandArgument.windowId;
      case r'windowType':
        return CommandArgument.windowType;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(CommandArgument self) {
    switch (self) {
      case CommandArgument.windowId:
        return r'windowId';
      case CommandArgument.windowType:
        return r'windowType';
    }
  }
}

extension CommandArgumentMapperExtension on CommandArgument {
  String toValue() {
    CommandArgumentMapper.ensureInitialized();
    return MapperContainer.globals.toValue<CommandArgument>(this) as String;
  }
}
