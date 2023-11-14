
import 'package:flutter/material.dart';

import '../Model/audio.dart';
import '../Services/audioServices.dart';

class PlayAudio extends StatefulWidget {
  AudioModel soundInfo;
   PlayAudio({required this.soundInfo,super.key});

  @override
  State<PlayAudio> createState() => _PlayAudioState();
}

class _PlayAudioState extends State<PlayAudio> {

  bool isPlaying = true;
  IconData audioIcon=Icons.pause_circle;



  @override
  void initState() {
    MyAudioService.initAudio(widget.soundInfo);
    // MyAudioService.playAudio();
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    MyAudioService.stopAudio();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.soundInfo.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset("assets/images/boy.jpg",width: 200,),
            // SizedBox(height: 20,),
            Image.asset("assets/images/audio.png", width: 300,),
            SizedBox(height: 20,),
            Text(widget.soundInfo.name),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: (){setState(() async {
                   // await MyAudioService.pauseAudio().then((value) => MyAudioService.playPreviousAudio());
                    //MyAudioService.playPreviousAudio();
                  });},
                  icon: Icon(Icons.skip_previous),iconSize: 75,),
                IconButton(
                  onPressed: () {
                    isPlaying=!isPlaying;
                    setState(() {
                      isPlaying?audioIcon= Icons.pause_circle:audioIcon=Icons.play_circle;
                      isPlaying?MyAudioService.playAudio():MyAudioService.pauseAudio();
                    });

                  },
                  icon: Icon(audioIcon),
                  color: Colors.red,
                  iconSize: 100,),
                IconButton(
                  onPressed: (){
                    setState(() {
                 // MyAudioService.playNextAudio();
                });
                    },
                  icon: Icon(Icons.skip_next,),iconSize: 75,),

              ],
            )


          ],
        ),
      ),

    );
  }

}
