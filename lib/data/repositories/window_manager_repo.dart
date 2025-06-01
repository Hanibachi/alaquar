import 'dart:convert';

import 'package:alaquar/data/models/window.dart';
import 'package:alaquar/data/repositories/config_repo.dart';
import 'package:alaquar/utilities/enums/window_type.dart';
import 'package:fl_linux_window_manager/models/layer.dart';
import 'package:kiwi/kiwi.dart';
import 'package:screen_retriever/screen_retriever.dart';

class WindowManagerRepo {
  final List<Window> windowsList;
  final Window currentWindow;
  WindowManagerRepo({Window? currentWindow})
    : currentWindow = currentWindow ?? KiwiContainer().resolve<Window>("currentWindow"),
      windowsList = [
        Window(id: "main", title: "main window", type: WindowType.main, monitorId: 0),
        if (currentWindow?.id != "main") ?currentWindow,
      ];

  Future<WindowManagerRepo> init() async {
    // define the config
    final config = KiwiContainer().resolve<ConfigRepo>("configRepo").config;
    // launch background windows if configuration includes them
    if (config["background"] != null) {
      final displays = await screenRetriever.getAllDisplays();
      // one window foreach display
      for (var display in displays) {
        // define the window
        final window = Window(
          id: (windowsList.length + 1).toString(),
          title: "background window ${(windowsList.length + 1)}",
          type: WindowType.background,
          width: display.size.width.toInt(),
          height: display.size.height.toInt(),
          monitorId: displays.indexOf(display),
          args: [jsonEncode(config)],
        );
        await Future.wait([
          window.create(),
          window.setlayer(WindowLayer.background),
          window.setMonitor(window.monitorId),
          window.show(),
        ]);
      }
    }
    return this;
  }

  Future<void> closeAllWindows() async {
    for (var window in windowsList) {
      await window.close();
    }
  }

  Future<void> createWindow(Window window) async {
    window.create();
  }
}
