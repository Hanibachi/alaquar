import 'dart:developer';
import 'package:alaquar/data/app/app.dart';
import 'package:alaquar/data/models/window.dart';
import 'package:alaquar/data/repositories/config_repo.dart';
import 'package:alaquar/data/repositories/requests_processor_repo.dart';
import 'package:alaquar/data/repositories/window_manager_repo.dart';
import 'package:alaquar/data/services/server_service.dart';
import 'package:alaquar/data/utilities/enums/window_type.dart';
import 'package:flutter/widgets.dart';
import 'package:kiwi/kiwi.dart';

void main(List<String> args) async {
  // ensure the flutter engine is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // case for the first app launch
  if (args.isEmpty) {
    // initialize the server service that listens on the local socket for client commands
    await ServerService.init();
    // initialize an instance of kiwi dependency injector
    KiwiContainer()
      // initialising and registering the rep that processes the commands
      ..registerInstance<RequestsProcessorRepo>(RequestsProcessorRepo()..init(), name: "requestsProcessorRepo")
      // initialising and registering the config repo
      ..registerInstance<ConfigRepo>(await ConfigRepo.init(), name: "configRepo")
      // initialising and registering the mainwindow
      ..registerInstance<Window>(
        Window(id: "main", title: "main window", type: WindowType.main, monitorId: 0),
        name: "currentWindow",
      )
      // initialising and registering the window manager repo
      ..registerInstance<WindowManagerRepo>(await WindowManagerRepo().init(), name: "windowManagerRepo");
  }
  // case for launching a window containig ui elements
  else if (args.firstOrNull == "newWindow" && args.length > 1) {
    try {
      // parse window information
      KiwiContainer().registerInstance<Window>(WindowMapper.fromJson(args.elementAt(1)), name: "currentWindow");
      runApp(App());
    } catch (e) {
      log("faileed to parse window details with exception:\n$e");
    }
  } else {
    log("received invalid arguments during launch");
  }
}
