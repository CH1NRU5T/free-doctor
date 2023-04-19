// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class Gridbox extends StatefulWidget {
  const Gridbox({super.key});

  @override
  State<Gridbox> createState() => _GridboxState();
}

class _GridboxState extends State<Gridbox> {
  ChewieController? _chewieController;

  Future<void> initVideoPlayerController() async {
    VideoPlayerController videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    await videoPlayerController.initialize();
    _chewieController = ChewieController(
      hideControlsTimer: const Duration(seconds: 2),
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      showControlsOnInitialize: false,
    );
  }

  @override
  void initState() {
    super.initState();
    getf();
  }

  String? file;
  @override
  void dispose() {
    _chewieController?.dispose();
    super.dispose();
  }

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
        await initVideoPlayerController();
        await showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              backgroundColor: Colors.transparent,
              child: SizedBox(
                height: 200,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Chewie(
                      controller: _chewieController!,
                    ),
                  ),
                ),
              ),
            );
          },
        );
        _chewieController!.pause();
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
