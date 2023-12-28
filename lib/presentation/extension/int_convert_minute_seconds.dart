extension IntConvertMinuteSeconds on int {
  String convertMinuteSeconds() {
    final minute = '${this~/60}'.padLeft(2, '0');
    final seconds = '${this%60}'.padLeft(2, '0');
    return '$minute:$seconds';
  }
}