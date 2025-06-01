import 'package:alaquar/utilities/enums/window_type.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:fl_linux_window_manager/fl_linux_window_manager.dart';
import 'package:fl_linux_window_manager/models/layer.dart';
part 'window.mapper.dart';

@MappableClass()
class Window with WindowMappable {
  final String id;
  final String title;
  final int width;
  final int height;
  final WindowType type;
  final bool isLayer;
  final int monitorId;
  final List<String> args;

  Window({
    required this.id,
    required this.title,
    this.width = 1270,
    this.height = 720,
    required this.type,
    required this.monitorId,
    this.isLayer = true,
    this.args = const [],
  });
  Future<void> hide() async => FlLinuxWindowManager.instance.hideWindow(windowId: id);

  Future<void> close() async => hide().then((value) => FlLinuxWindowManager.instance.closeWindow(windowId: id));

  Future<String> create({
    int? width,
    int? height,
  }) async => FlLinuxWindowManager.instance.createWindow(
    title: title,
    windowId: id,
    isLayer: isLayer,
    height: height ?? this.height,
    width: width ?? this.width,
    args: ["newWindow", toJson()],
  );

  Future<void> show() async => FlLinuxWindowManager.instance.showWindow(windowId: id);
  Future<void> setlayer(WindowLayer layer) async => FlLinuxWindowManager.instance.setLayer(layer, windowId: id);
  Future<void> setMonitor(int monitorId) async => FlLinuxWindowManager.instance.setMonitor(windowId: id, monitorId: monitorId);
}
