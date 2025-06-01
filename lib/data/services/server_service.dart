import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:xdg_directories/xdg_directories.dart';

class ServerService {
  static final _socketPath = "${runtimeDir?.path ?? "/tmp"}/alaquar.sock";
  String get socketPath => _socketPath;

  static bool _isInit = false;

  static late final ServerSocket _serverSocket;

  ServerService();

  static Future<void> init() async {
    if (!_isInit) {
      try {
        // defining the socket path
        final socketFile = File(_socketPath);
        await socketFile.exists() ? await socketFile.delete() : null;
        _serverSocket = await ServerSocket.bind(InternetAddress(_socketPath, type: InternetAddressType.unix), 0);
        _isInit = true;
        log("server socket created and initialized");
      } on SocketException {
        log("Detected an already running alaquar instance, exiting");
        exit(0);
      } catch (e) {
        log("failed to initialize server socket with exception:\n$e");
        exit(1);
      }
    }
  }

  void listen(StreamController<String> requestsStreamController) {
    _serverSocket.listen((client) => client.listen((rawCommad) => requestsStreamController.add(utf8.decode(rawCommad))));
    log("listening on socket $socketPath");
  }
}
