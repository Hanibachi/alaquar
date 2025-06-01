import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:alaquar/utilities/config_schema.dart';
import 'package:flutter/services.dart';
import 'package:json_schema/json_schema.dart';
import 'package:xdg_directories/xdg_directories.dart';

class ConfigRepo {
  late final Map _config;
  Map get config => _config;

  ConfigRepo._(this._config);

  static Future<ConfigRepo> init() async {
    final String configPath;
    String rawConfig;
    // getting the config data
    try {
      configPath = "${configHome.path}/alaquar/config.json";
      // setting config file
      final configFile = File(configPath);
      // case for NON existing config file
      if (!(await configFile.exists())) {
        log("the config file does not exist, creating ...");
        // creating the config file with default data from assets
        configFile
          ..createSync(recursive: true)
          ..writeAsStringSync(await rootBundle.loadString('assets/config.json'));
        // reading the config file
        rawConfig = await configFile.readAsString();
      }
      // case for existing config file
      else {
        // reading the config file
        rawConfig = await configFile.readAsString();
      }
      // initialising the config repo
      // case for valid config data
      if (_validate(rawConfig)) {
        log("loaded config data successfully");
        return ConfigRepo._(jsonDecode(rawConfig));
      }
      // case for invalid config data
      else {
        log("falling back to bundled config (not recommended for production)");
        return ConfigRepo._(jsonDecode(await rootBundle.loadString('assets/config.json')));
      }
    }
    // error handeling incase error comes from file access on the system
    on FileSystemException catch (e) {
      e.osError?.errorCode == 13
          ? log(
              "alaquar doesnt have necessary permission to read config file\n loading data from bundled config (not recommended for production)",
            )
          : null;
      // loading the bundled config
      rawConfig = await rootBundle.loadString('assets/config.json');
    }
    // error handeling incase of unidentified error
    catch (e) {
      log("failed to load/create config data with exception:\n$e");
      // exit app completely
      exit(1);
    }

    return ConfigRepo._({});
  }

  static bool _validate(String rawConfig) {
    try {
      // validate the config file content against the schema
      final validationResult = JsonSchema.create(configSchema()).validate(rawConfig, validateFormats: true, parseJson: true);
      // case for a valid config file
      if (validationResult.isValid) {
        // print any possible warnings
        for (var warning in validationResult.warnings) {
          log('''warning ---- ${warning.message}
        in instance : ${warning.instancePath}
        in schema : ${warning.instancePath}
        ''');
        }
        return true;
      }
      // case for an invalid config file
      else {
        log("invalid config file");
        // print all present errors
        for (var error in validationResult.errors) {
          log('''Error ---- ${error.message}
        in instance : ${error.instancePath}
        in schema : ${error.schemaPath} 
        ''');
        }
        return false;
      }
    }
    // case for an invalid config file
    catch (e) {
      log("exception on validating config file :\n$e");
      return false;
    }
  }
}
