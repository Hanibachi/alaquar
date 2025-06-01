// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'command.dart';

class CommandMapper extends ClassMapperBase<Command> {
  CommandMapper._();

  static CommandMapper? _instance;
  static CommandMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CommandMapper._());
      OrderMapper.ensureInitialized();
      CommandArgumentMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Command';

  static Order _$order(Command v) => v.order;
  static const Field<Command, Order> _f$order = Field('order', _$order);
  static Map<CommandArgument, dynamic> _$arguments(Command v) => v.arguments;
  static const Field<Command, Map<CommandArgument, dynamic>> _f$arguments =
      Field('arguments', _$arguments);

  @override
  final MappableFields<Command> fields = const {
    #order: _f$order,
    #arguments: _f$arguments,
  };

  static Command _instantiate(DecodingData data) {
    return Command(data.dec(_f$order), data.dec(_f$arguments));
  }

  @override
  final Function instantiate = _instantiate;

  static Command fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Command>(map);
  }

  static Command fromJson(String json) {
    return ensureInitialized().decodeJson<Command>(json);
  }
}

mixin CommandMappable {
  String toJson() {
    return CommandMapper.ensureInitialized()
        .encodeJson<Command>(this as Command);
  }

  Map<String, dynamic> toMap() {
    return CommandMapper.ensureInitialized()
        .encodeMap<Command>(this as Command);
  }

  CommandCopyWith<Command, Command, Command> get copyWith =>
      _CommandCopyWithImpl<Command, Command>(
          this as Command, $identity, $identity);
  @override
  String toString() {
    return CommandMapper.ensureInitialized().stringifyValue(this as Command);
  }

  @override
  bool operator ==(Object other) {
    return CommandMapper.ensureInitialized()
        .equalsValue(this as Command, other);
  }

  @override
  int get hashCode {
    return CommandMapper.ensureInitialized().hashValue(this as Command);
  }
}

extension CommandValueCopy<$R, $Out> on ObjectCopyWith<$R, Command, $Out> {
  CommandCopyWith<$R, Command, $Out> get $asCommand =>
      $base.as((v, t, t2) => _CommandCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CommandCopyWith<$R, $In extends Command, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, CommandArgument, dynamic,
      ObjectCopyWith<$R, dynamic, dynamic>> get arguments;
  $R call({Order? order, Map<CommandArgument, dynamic>? arguments});
  CommandCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CommandCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Command, $Out>
    implements CommandCopyWith<$R, Command, $Out> {
  _CommandCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Command> $mapper =
      CommandMapper.ensureInitialized();
  @override
  MapCopyWith<$R, CommandArgument, dynamic,
          ObjectCopyWith<$R, dynamic, dynamic>>
      get arguments => MapCopyWith($value.arguments,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(arguments: v));
  @override
  $R call({Order? order, Map<CommandArgument, dynamic>? arguments}) =>
      $apply(FieldCopyWithData({
        if (order != null) #order: order,
        if (arguments != null) #arguments: arguments
      }));
  @override
  Command $make(CopyWithData data) => Command(
      data.get(#order, or: $value.order),
      data.get(#arguments, or: $value.arguments));

  @override
  CommandCopyWith<$R2, Command, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CommandCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
