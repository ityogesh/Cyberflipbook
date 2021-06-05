import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class CustomListView extends StatefulWidget {
  CustomListView(
      {this.image,
      this.indexName,
      this.onTap,
      this.title,
      this.description,
      this.link,
      this.thumbnailImage,
      this.videoUrl,
      this.playIcon});
  var image;
  final thumbnailImage;
  final int Function(int) onTap;
  final indexName;
  final String title;
  final String link;
  final String description;
  final String videoUrl;
  final playIcon;

  @override
  _CustomListViewState createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  bool moreLessDetails = false;
  VideoPlayerController _controller;
  FlickManager flickManager;
  FlickControlManager flickControlManager;
  bool showVideo = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _setPlayer() {
    _controller = VideoPlayerController.network(widget.videoUrl ?? '');
    setState(() {
      _controller.play();
    });
    flickManager = FlickManager(videoPlayerController: _controller);
  }

  @override
  Widget build(BuildContext context) {
    return _listView();
  }

  _listView() {
    return Column(
      children: [
        title(),
        description(),
        moreDetails(),
        videoImageThumbnail(),
        links()
      ],
    );
  }

  title() {
    return Container(
      // height: 50,
      child: Text(
        widget.title ?? "",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }

  links() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 50,
        child: InkWell(
            child: Text(
              widget.link ?? "",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  decoration: TextDecoration.underline),
            ),
            onTap: () {}),
      ),
    );
  }

  _image() {}

  videoImageThumbnail() {
    return Padding(
        padding: const EdgeInsets.only(left: 2),
        child: widget.thumbnailImage == ""
            ? SizedBox()
            : Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: InkWell(
                    child: showVideo == false
                        ? Stack(
                            fit: StackFit.expand,
                            children: [
                              Image(
                                image: CachedNetworkImageProvider(
                                    widget.thumbnailImage),
                                fit: BoxFit.cover,
                              ),

                              //only for onDemandFeed
                              videoPlayIcon() //only for onDemadFeed
                            ],
                          )
                        : videoPlayer(),
                    onTap: () {
                      setState(() {
                        showVideo = !showVideo;
                      });
                      _setPlayer();
                    }),
              ));
  }

  videoPlayIcon() {
    return Center(
      child: Icon(
        widget.playIcon ?? null,
        size: 50,
        color: Colors.white,
      ),
    );
  }

  moreDetails() {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          '${widget.description}'.length <= 120
              ? Text(
                  "",
                  style: TextStyle(
                    fontSize: 1.0,
                  ),
                )
              : moreLessDetails
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('showless',
                          style: TextStyle(color: Colors.blue)),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('showmore',
                          style: TextStyle(color: Colors.blue)),
                    )
        ],
      ),
      onTap: () {
        setState(() {
          moreLessDetails = !moreLessDetails;
        });
      },
    );
  }

  video() {}

  description() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('${widget.description}' == "null" ? "" : widget.description,
            style: TextStyle(fontSize: 16.0),
            maxLines: moreLessDetails ? '${widget.description}'.length : 3,
            textAlign: TextAlign.start),
      ),
    );
  }

  Widget videoPlayer() {
    return Container(
      child: FlickVideoPlayer(
        flickManager: flickManager,
      ),
    );
  }
}
