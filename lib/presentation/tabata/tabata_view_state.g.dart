// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tabata_view_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TabataViewStateImpl _$$TabataViewStateImplFromJson(
        Map<String, dynamic> json) =>
    _$TabataViewStateImpl(
      currentState:
          $enumDecodeNullable(_$TabataElementEnumMap, json['currentState']) ??
              TabataElement.preparationTime,
      isPlaying: json['isPlaying'] as bool? ?? false,
      isEnd: json['isEnd'] as bool? ?? false,
      currentRound: json['currentRound'] as int? ?? 1,
      currentCycle: json['currentCycle'] as int? ?? 1,
      currentStateProgressedSecond:
          json['currentStateProgressedSecond'] as int? ?? 0,
      totalProgressedSecond: json['totalProgressedSecond'] as int? ?? 0,
    );

Map<String, dynamic> _$$TabataViewStateImplToJson(
        _$TabataViewStateImpl instance) =>
    <String, dynamic>{
      'currentState': _$TabataElementEnumMap[instance.currentState]!,
      'isPlaying': instance.isPlaying,
      'isEnd': instance.isEnd,
      'currentRound': instance.currentRound,
      'currentCycle': instance.currentCycle,
      'currentStateProgressedSecond': instance.currentStateProgressedSecond,
      'totalProgressedSecond': instance.totalProgressedSecond,
    };

const _$TabataElementEnumMap = {
  TabataElement.preparationTime: 'preparationTime',
  TabataElement.cycle: 'cycle',
  TabataElement.cycleBreakTime: 'cycleBreakTime',
  TabataElement.round: 'round',
  TabataElement.exerciseTime: 'exerciseTime',
  TabataElement.breakTime: 'breakTime',
};
