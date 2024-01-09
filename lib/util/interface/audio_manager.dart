enum StateAudio {
  preparation,
  exercise,
  breakTime,
  cycleBreakTime,
  complete;
}

abstract interface class AudioManager {
  void playTicktock();

  void playCount({required int count});

  void playState({required StateAudio state});

  void stop();

  void dispose();
}
