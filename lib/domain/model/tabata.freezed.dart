// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tabata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tabata _$TabataFromJson(Map<String, dynamic> json) {
  return _Tabata.fromJson(json);
}

/// @nodoc
mixin _$Tabata {
  int get preparationSeconds => throw _privateConstructorUsedError;
  int get cycleCount => throw _privateConstructorUsedError;
  int get cycleBreakSeconds => throw _privateConstructorUsedError;
  int get roundCount => throw _privateConstructorUsedError;
  int get exerciseSeconds => throw _privateConstructorUsedError;
  int get breakSeconds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TabataCopyWith<Tabata> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabataCopyWith<$Res> {
  factory $TabataCopyWith(Tabata value, $Res Function(Tabata) then) =
      _$TabataCopyWithImpl<$Res, Tabata>;
  @useResult
  $Res call(
      {int preparationSeconds,
      int cycleCount,
      int cycleBreakSeconds,
      int roundCount,
      int exerciseSeconds,
      int breakSeconds});
}

/// @nodoc
class _$TabataCopyWithImpl<$Res, $Val extends Tabata>
    implements $TabataCopyWith<$Res> {
  _$TabataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preparationSeconds = null,
    Object? cycleCount = null,
    Object? cycleBreakSeconds = null,
    Object? roundCount = null,
    Object? exerciseSeconds = null,
    Object? breakSeconds = null,
  }) {
    return _then(_value.copyWith(
      preparationSeconds: null == preparationSeconds
          ? _value.preparationSeconds
          : preparationSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      cycleCount: null == cycleCount
          ? _value.cycleCount
          : cycleCount // ignore: cast_nullable_to_non_nullable
              as int,
      cycleBreakSeconds: null == cycleBreakSeconds
          ? _value.cycleBreakSeconds
          : cycleBreakSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      roundCount: null == roundCount
          ? _value.roundCount
          : roundCount // ignore: cast_nullable_to_non_nullable
              as int,
      exerciseSeconds: null == exerciseSeconds
          ? _value.exerciseSeconds
          : exerciseSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      breakSeconds: null == breakSeconds
          ? _value.breakSeconds
          : breakSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TabataImplCopyWith<$Res> implements $TabataCopyWith<$Res> {
  factory _$$TabataImplCopyWith(
          _$TabataImpl value, $Res Function(_$TabataImpl) then) =
      __$$TabataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int preparationSeconds,
      int cycleCount,
      int cycleBreakSeconds,
      int roundCount,
      int exerciseSeconds,
      int breakSeconds});
}

/// @nodoc
class __$$TabataImplCopyWithImpl<$Res>
    extends _$TabataCopyWithImpl<$Res, _$TabataImpl>
    implements _$$TabataImplCopyWith<$Res> {
  __$$TabataImplCopyWithImpl(
      _$TabataImpl _value, $Res Function(_$TabataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preparationSeconds = null,
    Object? cycleCount = null,
    Object? cycleBreakSeconds = null,
    Object? roundCount = null,
    Object? exerciseSeconds = null,
    Object? breakSeconds = null,
  }) {
    return _then(_$TabataImpl(
      preparationSeconds: null == preparationSeconds
          ? _value.preparationSeconds
          : preparationSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      cycleCount: null == cycleCount
          ? _value.cycleCount
          : cycleCount // ignore: cast_nullable_to_non_nullable
              as int,
      cycleBreakSeconds: null == cycleBreakSeconds
          ? _value.cycleBreakSeconds
          : cycleBreakSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      roundCount: null == roundCount
          ? _value.roundCount
          : roundCount // ignore: cast_nullable_to_non_nullable
              as int,
      exerciseSeconds: null == exerciseSeconds
          ? _value.exerciseSeconds
          : exerciseSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      breakSeconds: null == breakSeconds
          ? _value.breakSeconds
          : breakSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TabataImpl extends _Tabata with DiagnosticableTreeMixin {
  const _$TabataImpl(
      {this.preparationSeconds = 60,
      this.cycleCount = 3,
      this.cycleBreakSeconds = 30,
      this.roundCount = 7,
      this.exerciseSeconds = 90,
      this.breakSeconds = 10})
      : assert(preparationSeconds <= 3599 && preparationSeconds >= 1),
        assert(cycleCount <= 10 && cycleCount >= 1),
        assert(cycleBreakSeconds <= 3599 && cycleBreakSeconds >= 1),
        assert(roundCount <= 20 && roundCount >= 1),
        assert(exerciseSeconds <= 3599 && exerciseSeconds >= 1),
        assert(breakSeconds <= 3599 && breakSeconds >= 1),
        super._();

  factory _$TabataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TabataImplFromJson(json);

  @override
  @JsonKey()
  final int preparationSeconds;
  @override
  @JsonKey()
  final int cycleCount;
  @override
  @JsonKey()
  final int cycleBreakSeconds;
  @override
  @JsonKey()
  final int roundCount;
  @override
  @JsonKey()
  final int exerciseSeconds;
  @override
  @JsonKey()
  final int breakSeconds;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Tabata(preparationSeconds: $preparationSeconds, cycleCount: $cycleCount, cycleBreakSeconds: $cycleBreakSeconds, roundCount: $roundCount, exerciseSeconds: $exerciseSeconds, breakSeconds: $breakSeconds)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Tabata'))
      ..add(DiagnosticsProperty('preparationSeconds', preparationSeconds))
      ..add(DiagnosticsProperty('cycleCount', cycleCount))
      ..add(DiagnosticsProperty('cycleBreakSeconds', cycleBreakSeconds))
      ..add(DiagnosticsProperty('roundCount', roundCount))
      ..add(DiagnosticsProperty('exerciseSeconds', exerciseSeconds))
      ..add(DiagnosticsProperty('breakSeconds', breakSeconds));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TabataImpl &&
            (identical(other.preparationSeconds, preparationSeconds) ||
                other.preparationSeconds == preparationSeconds) &&
            (identical(other.cycleCount, cycleCount) ||
                other.cycleCount == cycleCount) &&
            (identical(other.cycleBreakSeconds, cycleBreakSeconds) ||
                other.cycleBreakSeconds == cycleBreakSeconds) &&
            (identical(other.roundCount, roundCount) ||
                other.roundCount == roundCount) &&
            (identical(other.exerciseSeconds, exerciseSeconds) ||
                other.exerciseSeconds == exerciseSeconds) &&
            (identical(other.breakSeconds, breakSeconds) ||
                other.breakSeconds == breakSeconds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, preparationSeconds, cycleCount,
      cycleBreakSeconds, roundCount, exerciseSeconds, breakSeconds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TabataImplCopyWith<_$TabataImpl> get copyWith =>
      __$$TabataImplCopyWithImpl<_$TabataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TabataImplToJson(
      this,
    );
  }
}

abstract class _Tabata extends Tabata {
  const factory _Tabata(
      {final int preparationSeconds,
      final int cycleCount,
      final int cycleBreakSeconds,
      final int roundCount,
      final int exerciseSeconds,
      final int breakSeconds}) = _$TabataImpl;
  const _Tabata._() : super._();

  factory _Tabata.fromJson(Map<String, dynamic> json) = _$TabataImpl.fromJson;

  @override
  int get preparationSeconds;
  @override
  int get cycleCount;
  @override
  int get cycleBreakSeconds;
  @override
  int get roundCount;
  @override
  int get exerciseSeconds;
  @override
  int get breakSeconds;
  @override
  @JsonKey(ignore: true)
  _$$TabataImplCopyWith<_$TabataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
