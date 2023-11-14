
import 'package:audio_app/Screens/play_audio.dart';
import 'package:audio_app/Services/audioServices.dart';
import 'package:flutter/material.dart';

import '../Model/audio.dart';

class AudioList extends StatefulWidget {
  const AudioList({super.key});

  @override
  State<AudioList> createState() => _AudioListState();
}

class _AudioListState extends State<AudioList> {

 List audioList=MyAudioService.myAudioList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quran"),
      ),
      body: ListView.builder(
        itemCount: audioList.length,
        itemBuilder: (BuildContext context, int index) {
          return  GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>PlayAudio(soundInfo: audioList[index]))

              );

            },
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/boy.jpg"),
                  ),
                  title: Text(audioList[index].name),
                  trailing: Icon(Icons.play_arrow),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
