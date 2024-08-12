import 'package:flutter/material.dart';
import 'package:itunes/models/itunes_data_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/assets.dart';
import '../utils/auto_video_player.dart';

class DetailsPage extends StatefulWidget {
  Results mediaResult;

  DetailsPage({super.key, required this.mediaResult});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
        ),
        title: const Text(
          'Description',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Image.network(
                    scale: .6,
                    widget.mediaResult.artworkUrl100.toString(),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40, top: 30),
                        child: Text(
                          widget.mediaResult.trackName.toString(),
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, top: 10),
                        child: Text(
                          widget.mediaResult.artistName.toString(),
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, top: 10),
                        child: Text(
                          widget.mediaResult.primaryGenreName.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: (){
                              _launchURL(widget.mediaResult.previewUrl.toString());
                            },
                            child: const Text(
                              'Preview',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              _launchURL(widget.mediaResult.collectionViewUrl.toString());
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10,left: 20),
                              child: Image.asset(ItunesAssets.safariIcon,
                                width: 50,
                                height: 20,
                                color: Colors.blueAccent,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Preview',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: AutoPlayVideoPlayer(
                    videoUrl: widget.mediaResult.previewUrl.toString()),
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Description',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.mediaResult.longDescription.toString(),
              maxLines: 4,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
