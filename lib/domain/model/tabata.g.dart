// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tabata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TabataImpl _$$TabataImplFromJson(Map<String, dynamic> json) => _$TabataImpl(
      preparationSeconds: json['preparationSeconds'] as int? ?? 60,
      cycleCount: json['cycleCount'] as int? ?? 3,
      cycleBreakSeconds: json['cycleBreakSeconds'] as int? ?? 30,
      roundCount: json['roundCount'] as int? ?? 7,
      exerciseSeconds: json['exerciseSeconds'] as int? ?? 90,
      breakSeconds: json['breakSeconds'] as int? ?? 10,
    );

Map<String, dynamic> _$$TabataImplToJson(_$TabataImpl instance) =>
    <String, dynamic>{
      'preparationSeconds': instance.preparationSeconds,
      'cycleCount': instance.cycleCount,
      'cycleBreakSeconds': instance.cycleBreakSeconds,
      'roundCount': instance.roundCount,
      'exerciseSeconds': instance.exerciseSeconds,
      'breakSeconds': instance.breakSeconds,
    };
