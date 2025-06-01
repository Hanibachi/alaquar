import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:alaquar/data/models/command.dart';
import 'package:alaquar/data/repositories/window_manager_repo.dart';
import 'package:alaquar/data/services/server_service.dart';
import 'package:alaquar/data/utilities/enums/order.dart';
import 'package:kiwi/kiwi.dart';

class RequestsProcessorRepo {
  static bool isRouting = false;
  final StreamController<String> _requestsStreamController;
  final ServerService _serverService;
  final KiwiContainer _kiwi;

  RequestsProcessorRepo()
    : _kiwi = KiwiContainer(),
      _requestsStreamController = StreamController<String>.broadcast(),
      _serverService = ServerService();

  void init() {
    // case for already listening for commands
    if (isRouting) {
      log(" one routing is already listening");
    }
    // case for no previously initialized routing
    else {
      // start the socket server and publish incomming requests to the controller
      _serverService.listen(_requestsStreamController);
      // flag the routing as initialized
      isRouting = true;
      // listen to incomming requests and process them
      _requestsStreamController.stream.listen((request) async {
        try {
          // parse the command
          final command = CommandMapper.fromJson(request);
          // iterate through possible commands
          switch (command.order) {
            // case for receiving an close ccommand
            case Order.close:
              // close all windows
              await _kiwi.resolve<WindowManagerRepo>().closeAllWindows();
              // exit the app
              exit(0);
            // case for receiving a command that isnt accounted for
            case Order.createWindow:
              // final displays = await screenRetriever.getAllDisplays();
              // print(await FlLinuxWindowManager.instance.getMonitorList());
              // print(displays.first.toJson());
              ;
            default:
              log("nothing");
          }
        }
        // handling parssing errors
        on FormatException catch (e) {
          log("recieved unkown data format:\n$e");
        }
        // handling other exceptions
        on Exception catch (e) {
          log("unkown exception during request proocessing:\n$e");
        }
      });
    }
  }
}
