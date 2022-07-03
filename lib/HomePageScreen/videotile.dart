import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:yellow_page_assignment/Constants/constants.dart';

class VideoWidget extends StatefulWidget {
  final bool play;
  final String url;
  final String img;
  final String desc;

  const VideoWidget(
      {Key? key, required this.url, required this.play, required this.desc, required this.img})
      : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.url);

    _initializeVideoPlayerFuture = videoPlayerController.initialize().then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Container(
              height: height * 0.33,
              color: ytcolor,
              key: PageStorageKey(widget.url),
              child: Column(
                children: [
                  Container(
                    color: ytcolor,
                    height: height * 0.26,
                    key: PageStorageKey(widget.url),
                    child: widget.play ? Chewie(
                      key: PageStorageKey(widget.url),
                      controller: ChewieController(
                        videoPlayerController: videoPlayerController,
                        aspectRatio: 16 / 9,
                        materialProgressColors: ChewieProgressColors(
                            handleColor: Colors.red,
                            playedColor: Colors.red,
                            backgroundColor: ytbgcolor),
                        allowFullScreen: false,
                        showOptions: false,
                        autoInitialize: true,
                        looping: false,
                        autoPlay: widget.play,
                        errorBuilder: (context, errorMessage) {
                          return Center(
                            child: Text(
                               "\n Please check your internet Connection \n\n OR \n \n" + errorMessage,
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      ),
                    ): Image.network(widget.img),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/yellow_class_logo.png',
                          height: height * 0.07,
                          width: width * 0.07),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          widget.desc,
                          style: defaultTextStyle,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
