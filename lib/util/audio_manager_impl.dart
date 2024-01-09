import 'package:just_audio/just_audio.dart';
import 'package:tabata_timer/util/interface/audio_manager.dart';

final class AudioManagerImpl implements AudioManager {
  final _ticktockPlayer = AudioPlayer(
    handleInterruptions: false,
    androidApplyAudioAttributes: false,
    handleAudioSessionActivation: false,
  );
  final _counterPlayer = AudioPlayer(
    handleInterruptions: false,
    androidApplyAudioAttributes: false,
    handleAudioSessionActivation: false,
  );
  final _statePlayer = AudioPlayer(
    handleInterruptions: false,
    androidApplyAudioAttributes: false,
    handleAudioSessionActivation: false,
  );

  AudioManagerImpl() {
    _setAudio();
  }

  void _setAudio() async {
    await Future.value(
      [
        _ticktockPlayer.setAudioSource(AudioSource.asset('assets/audios/ticktock.wav')),
        _ticktockPlayer.setLoopMode(LoopMode.one),
        _counterPlayer.setLoopMode(LoopMode.off),
        _statePlayer.setLoopMode(LoopMode.off),
      ],
    );
  }

  @override
  void playTicktock() async {
    if (_ticktockPlayer.playing) return;
    await _ticktockPlayer.play();
  }

  @override
  void playCount({required int count}) async {
    if (_counterPlayer.playing) return;
    if (count == 1) {
      _playCount(source: AudioSource.asset('assets/audios/one.wav'));
    } else if (count == 2) {
      _playCount(source: AudioSource.asset('assets/audios/two.wav'));
    } else if (count == 3) {
      _playCount(source: AudioSource.asset('assets/audios/three.wav'));
    } else if (count == 4) {
      _playCount(source: AudioSource.asset('assets/audios/four.wav'));
    } else if (count == 5) {
      _playCount(source: AudioSource.asset('assets/audios/five.wav'));
    }
  }

  void _playCount({required AudioSource source}) async {
    await _counterPlayer.setAudioSource(source);
    await _counterPlayer.play();
    await _counterPlayer.stop();
  }

  @override
  void playState({required StateAudio state}) async {
    if (_statePlayer.playing) return;
    switch (state) {
      case StateAudio.preparation:
        _playState(source: AudioSource.asset('assets/audios/preparation.wav'));
        break;
      case StateAudio.exercise:
        _playState(source: AudioSource.asset('assets/audios/exercise.wav'));
        break;
      case StateAudio.breakTime:
        _playState(source: AudioSource.asset('assets/audios/break_time.wav'));
        break;
      case StateAudio.cycleBreakTime:
        _playState(source: AudioSource.asset('assets/audios/cycle_break_time.wav'));
        break;
      case StateAudio.complete:
        _playState(source: AudioSource.asset('assets/audios/complete.wav'));
        break;
    }
  }

  void _playState({required AudioSource source}) async {
    await _statePlayer.setAudioSource(source);
    await _statePlayer.play();
    await _statePlayer.stop();
  }

  @override
  void stop() async {
    await Future.value(
      [
        _ticktockPlayer.stop(),
        _counterPlayer.stop(),
        _statePlayer.stop(),
      ],
    );
  }

  @override
  void dispose() async {
    await Future.value(
      [
        _ticktockPlayer.dispose(),
        _counterPlayer.dispose(),
        _statePlayer.dispose(),
      ],
    );
  }
}
