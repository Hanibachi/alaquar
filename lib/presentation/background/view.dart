import 'dart:async';
import 'dart:io';
import 'package:alaquar/presentation/background/view_model.dart';
import 'package:dartx/dartx_io.dart';
import 'package:flutter/material.dart';

class BackgroundView extends StatefulWidget {
  final BackgroundViewModel viewModel;
  const BackgroundView({super.key, required this.viewModel});

  @override
  State<BackgroundView> createState() => _BackgroundViewState();
}

class _BackgroundViewState extends State<BackgroundView> {
  late final String mode;
  late final Color? color;
  late final File? image;
  late final List<File> slides;
  late Timer? timer;
  @override
  void initState() {
    super.initState();
    mode = widget.viewModel.mode;
    color = widget.viewModel.color;
    image = widget.viewModel.image;
    if (mode == "slides") {
      slides = widget.viewModel.slides;
      timer = Timer.periodic((widget.viewModel.monitorConfig["duration"] as int).seconds, (timer) => changeSlide());
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void changeSlide() => setState(() => slides.shuffle());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        image: mode == "image"
            ? DecorationImage(image: FileImage(image!), fit: BoxFit.cover)
            : mode == "slides"
            ? DecorationImage(image: FileImage(slides.first), fit: BoxFit.cover)
            : null,
      ),
    );
  }
}
