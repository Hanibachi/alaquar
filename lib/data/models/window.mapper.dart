// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'window.dart';

class WindowMapper extends ClassMapperBase<Window> {
  WindowMapper._();

  static WindowMapper? _instance;
  static WindowMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WindowMapper._());
      WindowTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Window';

  static String _$id(Window v) => v.id;
  static const Field<Window, String> _f$id = Field('id', _$id);
  static String _$title(Window v) => v.title;
  static const Field<Window, String> _f$title = Field('title', _$title);
  static int _$width(Window v) => v.width;
  static const Field<Window, int> _f$width =
      Field('width', _$width, opt: true, def: 1270);
  static int _$height(Window v) => v.height;
  static const Field<Window, int> _f$height =
      Field('height', _$height, opt: true, def: 720);
  static WindowType _$type(Window v) => v.type;
  static const Field<Window, WindowType> _f$type = Field('type', _$type);
  static int _$monitorId(Window v) => v.monitorId;
  static const Field<Window, int> _f$monitorId =
      Field('monitorId', _$monitorId);
  static bool _$isLayer(Window v) => v.isLayer;
  static const Field<Window, bool> _f$isLayer =
      Field('isLayer', _$isLayer, opt: true, def: true);
  static List<String> _$args(Window v) => v.args;
  static const Field<Window, List<String>> _f$args =
      Field('args', _$args, opt: true, def: const []);

  @override
  final MappableFields<Window> fields = const {
    #id: _f$id,
    #title: _f$title,
    #width: _f$width,
    #height: _f$height,
    #type: _f$type,
    #monitorId: _f$monitorId,
    #isLayer: _f$isLayer,
    #args: _f$args,
  };

  static Window _instantiate(DecodingData data) {
    return Window(
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        width: data.dec(_f$width),
        height: data.dec(_f$height),
        type: data.dec(_f$type),
        monitorId: data.dec(_f$monitorId),
        isLayer: data.dec(_f$isLayer),
        args: data.dec(_f$args));
  }

  @override
  final Function instantiate = _instantiate;

  static Window fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Window>(map);
  }

  static Window fromJson(String json) {
    return ensureInitialized().decodeJson<Window>(json);
  }
}

mixin WindowMappable {
  String toJson() {
    return WindowMapper.ensureInitialized().encodeJson<Window>(this as Window);
  }

  Map<String, dynamic> toMap() {
    return WindowMapper.ensureInitialized().encodeMap<Window>(this as Window);
  }

  WindowCopyWith<Window, Window, Window> get copyWith =>
      _WindowCopyWithImpl<Window, Window>(this as Window, $identity, $identity);
  @override
  String toString() {
    return WindowMapper.ensureInitialized().stringifyValue(this as Window);
  }

  @override
  bool operator ==(Object other) {
    return WindowMapper.ensureInitialized().equalsValue(this as Window, other);
  }

  @override
  int get hashCode {
    return WindowMapper.ensureInitialized().hashValue(this as Window);
  }
}

extension WindowValueCopy<$R, $Out> on ObjectCopyWith<$R, Window, $Out> {
  WindowCopyWith<$R, Window, $Out> get $asWindow =>
      $base.as((v, t, t2) => _WindowCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class WindowCopyWith<$R, $In extends Window, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get args;
  $R call(
      {String? id,
      String? title,
      int? width,
      int? height,
      WindowType? type,
      int? monitorId,
      bool? isLayer,
      List<String>? args});
  WindowCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _WindowCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Window, $Out>
    implements WindowCopyWith<$R, Window, $Out> {
  _WindowCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Window> $mapper = WindowMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get args =>
      ListCopyWith($value.args, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(args: v));
  @override
  $R call(
          {String? id,
          String? title,
          int? width,
          int? height,
          WindowType? type,
          int? monitorId,
          bool? isLayer,
          List<String>? args}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (title != null) #title: title,
        if (width != null) #width: width,
        if (height != null) #height: height,
        if (type != null) #type: type,
        if (monitorId != null) #monitorId: monitorId,
        if (isLayer != null) #isLayer: isLayer,
        if (args != null) #args: args
      }));
  @override
  Window $make(CopyWithData data) => Window(
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      width: data.get(#width, or: $value.width),
      height: data.get(#height, or: $value.height),
      type: data.get(#type, or: $value.type),
      monitorId: data.get(#monitorId, or: $value.monitorId),
      isLayer: data.get(#isLayer, or: $value.isLayer),
      args: data.get(#args, or: $value.args));

  @override
  WindowCopyWith<$R2, Window, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _WindowCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
