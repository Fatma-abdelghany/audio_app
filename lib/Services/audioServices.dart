import 'package:assets_audio_player/assets_audio_player.dart';

import '../Model/audio.dart';

class MyAudioService{

  static final  _myAudio=  AssetsAudioPlayer();

  static List<AudioModel> myAudioList= [
    AudioModel(name: 'Al-Faatiha', soundpath: 'assets/audio/001.mp3'),
    AudioModel(name: 'An-Naas', soundpath: 'assets/audio/114.mp3'),
    AudioModel(name: 'Al-Falaq', soundpath: 'assets/audio/113.mp3'),
    AudioModel(name: 'Al-Ikhlās', soundpath: 'assets/audio/112.mp3'),
    AudioModel(name: 'Al-Masad', soundpath: 'assets/audio/111.mp3'),
    AudioModel(name: 'An-Nasr', soundpath: 'assets/audio/110.mp3'),
    AudioModel(name: 'Al-Kaafiroon', soundpath: 'assets/audio/109.mp3'),
    AudioModel(name: 'Al-Kawthar', soundpath: 'assets/audio/108.mp3'),
    AudioModel(name: 'Al-Maaun', soundpath: 'assets/audio/107.mp3'),
    AudioModel(name: 'Quraish', soundpath: 'assets/audio/106.mp3'),
  ];

  static Future<void> initAudio(AudioModel myAudio) async {
  //  await _myAudio.open(Audio(myAudio.soundpath),autoStart: false);
    await _myAudio.open(Audio(myAudio.soundpath),
      showNotification: true,
      notificationSettings: new NotificationSettings(
        playPauseEnabled: true,
        nextEnabled: true,
        prevEnabled: true,

      ),
    );


  }

  static Future<void> playAudio() async {
    _myAudio.play();
  }
  static Future<void> playNextAudio() async {
    _myAudio.next();
  }
  static Future<void> playPreviousAudio() async {
    try{ await _myAudio.previous();}
    catch(e){
      print("=========================== $e");
    }

  }
  static Future<void> stopAudio() async {
    _myAudio.stop();
  }
  static Future<void> pauseAudio() async {
    _myAudio.pause();
  }
  static Future<void> onMyAudioPositionChanged(playerTimeNow) async {
    _myAudio.currentPosition.listen((positionValue) {
      playerTimeNow = positionValue;
    });
  }
}