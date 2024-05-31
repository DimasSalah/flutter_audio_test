import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/audio_controller.dart';

class AudioView extends GetView<AudioController> {
  const AudioView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AudioView'),
        centerTitle: true,
      ),
      body: Center(
          child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('AudioView is working'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.formatDuration(controller.position.value),
                ),
                const Text(' / '),
                Text(
                  controller.formatDuration(controller.duration.value),
                ),
              ],
            ),
            Slider(
                min: 0,
                max: controller.duration.value.inSeconds.toDouble(),
                value: controller.position.value.inSeconds.toDouble(),
                onChanged: controller.handleSeek),
            IconButton(
              onPressed: controller.handlePlayPause,
              icon: Icon(
                  controller.player.playing ? Icons.pause : Icons.play_arrow),
            )
          ],
        ),
      )),
    );
  }
}
