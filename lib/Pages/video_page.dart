import 'package:debtstiny/Components/button_short.dart';
import 'package:debtstiny/Pages/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:debtstiny/Components/top_backBar.dart';
import 'package:debtstiny/Controller/youtube_controller.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late final YoutubeController _youtubeController;

  @override
  void initState() {
    super.initState();
    _youtubeController = YoutubeController(
        videoId: 'CHiOBzqcMV8',
        title:
            'Easy Steps To Get Out Of Debt, According To A Certified Financial Planner');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3FCF7),
      appBar: TopBackBar(
        title: 'Milestone 1',
        onBack: () {
          Navigator.of(context).pop();
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Watch this video and answer the quiz to unlock this milestone',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'PT Sans',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(
              thickness: 1.5,
              color: Color(0xFF33363F),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _youtubeController.build(context),
                SizedBox(height: 15),
                ButtonShort(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuizPage(),
                      ),
                    );
                  },
                  title: 'Answer Quiz',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }
}
