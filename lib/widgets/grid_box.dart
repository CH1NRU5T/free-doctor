// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class Gridbox extends StatefulWidget {
  const Gridbox({super.key});

  @override
  State<Gridbox> createState() => _GridboxState();
}

class _GridboxState extends State<Gridbox> {
  BetterPlayerController? _controller;
  Future<void> _initVideoPlayer() async {
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );

    _controller = BetterPlayerController(
        const BetterPlayerConfiguration(
            autoPlay: true,
            showPlaceholderUntilPlay: true,
            autoDispose: true,
            aspectRatio: 16 / 9,
            fit: BoxFit.cover,
            controlsConfiguration: BetterPlayerControlsConfiguration(
              showControlsOnInitialize: false,
            )),
        betterPlayerDataSource: betterPlayerDataSource);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getf();
  }

  String? file;

  getf() async {
    final fileName = await VideoThumbnail.thumbnailFile(
      video:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      imageFormat: ImageFormat.WEBP,
      quality: 75,
    );
    file = fileName;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await _initVideoPlayer();

        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: SizedBox(
                height: 150,
                child: AspectRatio(
                  aspectRatio: _controller!.getAspectRatio()!,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: BetterPlayer(
                      controller: _controller!,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 300,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: file == null
            ? Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.white60,
                child: Container(
                  height: 300,
                  width: 150,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ))
            : Image.file(
                File(file!),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
