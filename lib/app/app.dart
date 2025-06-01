import 'package:alaquar/data/models/window.dart';
import 'package:alaquar/utilities/enums/window_type.dart';
import 'package:alaquar/presentation/background/view.dart';
import 'package:alaquar/presentation/background/view_model.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final Window currentWindow;
  @override
  void initState() {
    super.initState();
    currentWindow = KiwiContainer().resolve<Window>("currentWindow");
  }

  @override
  Widget build(BuildContext context) {
    if (currentWindow.type == WindowType.background) {
      return BackgroundView(viewModel: BackgroundViewModel(window: currentWindow));
    }
    return const Placeholder();
  }
}
