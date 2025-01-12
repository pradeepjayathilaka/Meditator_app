import 'package:flutter/material.dart';
import 'package:meditator_app/models/function_data_model.dart';
import 'package:meditator_app/utils/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FunctionPage extends StatefulWidget {
  FunctionData functionData;
  FunctionPage({
    super.key,
    required this.functionData,
  });

  @override
  State<FunctionPage> createState() => _FunctionPageState();
}

class _FunctionPageState extends State<FunctionPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    //get video id from url
    final videoId = YoutubePlayer.convertUrlToId(widget.functionData.url) ?? "";

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.functionData.title,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_controller.initialVideoId.isNotEmpty)
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: YoutubePlayer(controller: _controller),
                  ),
                )
              else
                const Text("No video available!"),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Duration: ${widget.functionData.duration} min",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: AppColors.primaryGrey,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Category: ${widget.functionData.category} ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: AppColors.primaryGreen,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.functionData.description,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: AppColors.primaryDarkBlue,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
