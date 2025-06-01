import 'dart:convert';
import 'dart:io';

import 'package:alaquar/data/models/window.dart';
import 'package:alaquar/data/utilities/extensions/color_from_hex_extension.dart';
import 'package:alaquar/data/utilities/extensions/file_system_entity_from_path_extension.dart';
import 'package:dartx/dartx_io.dart';
import 'package:flutter/widgets.dart';

class BackgroundViewModel {
  final Window window;
  final Map<String, dynamic> globalConfig;
  late final Map<String, dynamic> monitorConfig;
  String get mode => _mode();
  Color? get color => (monitorConfig["color"] as String?)?.toColor();
  File? get image => (monitorConfig["image"] as String?)?.toFile();
  List<File> get slides => _slides();
  BackgroundViewModel({required this.window}) : globalConfig = jsonDecode(window.args.first) as Map<String, dynamic>;

  String _mode() {
    final backgroundConfig = globalConfig["background"];
    if (backgroundConfig is Map<String, dynamic>) {
      monitorConfig = backgroundConfig;
      return monitorConfig["image"] != null
          ? "image"
          : monitorConfig["slides"] != null
          ? "slides"
          : "color";
    } else if (backgroundConfig is List<Map<String, dynamic>>) {
      monitorConfig = backgroundConfig.firstWhere(
        (c) => c["monitorId"] == window.monitorId,
        orElse: () => backgroundConfig.first,
      );
      return monitorConfig["image"] != null
          ? "image"
          : monitorConfig["slides"] != null
          ? "slides"
          : "color";
    } else {
      throw Exception("invalid background config");
    }
  }

  List<File> _slides() {
    final directory = (monitorConfig["slides"] as String?)?.toDirectory();
    if (directory?.existsSync() ?? false) {
      return directory!
          .listSync(recursive: monitorConfig["recursive"])
          .where(
            (entity) =>
                (entity is File) &&
                [".jpg", ".jpeg", ".png", ".gif", ".bmp", ".webp", ".bmp"].contains(entity.extension.toLowerCase()),
          )
          .map((entity) => entity.path.toFile())
          .toList();
    } else {
      return [];
    }
  }
}
