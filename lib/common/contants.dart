const int maximumTime = 3600;
const int minimum = 0;
const int maximumCount = 100;
const int maximumMinute = 60;
const int maximumSeconds = 60;

final List<String> countList = List<String>.generate(maximumCount - 1, (index) => '${index + 1}');
final List<String> minuteList = List<String>.generate(maximumMinute - 1, (index) => '${index + 1}');
final List<String> secondsList = List<String>.generate(maximumSeconds - 1, (index) => '${index + 1}');
