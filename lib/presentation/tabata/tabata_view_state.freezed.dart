// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../presentation/tabata/tabata_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TabataViewState _$TabataViewStateFromJson(Map<String, dynamic> json) {
  return _TabataViewState.fromJson(json);
}

/// @nodoc
mixin _$TabataViewState {
  TabataElement get currentState => throw _privateConstructorUsedError;
  bool get isPlaying => throw _privateConstructorUsedError;
  bool get isEnd => throw _privateConstructorUsedError;
  int get currentRound => throw _privateConstructorUsedError;
  int get currentCycle => throw _privateConstructorUsedError;
  int get currentStateProgressedSecond => throw _privateConstructorUsedError;
  int get totalProgressedSecond => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TabataViewStateCopyWith<TabataViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabataViewStateCopyWith<$Res> {
  factory $TabataViewStateCopyWith(
          TabataViewState value, $Res Function(TabataViewState) then) =
      _$TabataViewStateCopyWithImpl<$Res, TabataViewState>;
  @useResult
  $Res call(
      {TabataElement currentState,
      bool isPlaying,
      bool isEnd,
      int currentRound,
      int currentCycle,
      int currentStateProgressedSecond,
      int totalProgressedSecond});
}

/// @nodoc
class _$TabataViewStateCopyWithImpl<$Res, $Val extends TabataViewState>
    implements $TabataViewStateCopyWith<$Res> {
  _$TabataViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentState = null,
    Object? isPlaying = null,
    Object? isEnd = null,
    Object? currentRound = null,
    Object? currentCycle = null,
    Object? currentStateProgressedSecond = null,
    Object? totalProgressedSecond = null,
  }) {
    return _then(_value.copyWith(
      currentState: null == currentState
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as TabataElement,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      isEnd: null == isEnd
          ? _value.isEnd
          : isEnd // ignore: cast_nullable_to_non_nullable
              as bool,
      currentRound: null == currentRound
          ? _value.currentRound
          : currentRound // ignore: cast_nullable_to_non_nullable
              as int,
      currentCycle: null == currentCycle
          ? _value.currentCycle
          : currentCycle // ignore: cast_nullable_to_non_nullable
              as int,
      currentStateProgressedSecond: null == currentStateProgressedSecond
          ? _value.currentStateProgressedSecond
          : currentStateProgressedSecond // ignore: cast_nullable_to_non_nullable
              as int,
      totalProgressedSecond: null == totalProgressedSecond
          ? _value.totalProgressedSecond
          : totalProgressedSecond // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TabataViewStateImplCopyWith<$Res>
    implements $TabataViewStateCopyWith<$Res> {
  factory _$$TabataViewStateImplCopyWith(_$TabataViewStateImpl value,
          $Res Function(_$TabataViewStateImpl) then) =
      __$$TabataViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TabataElement currentState,
      bool isPlaying,
      bool isEnd,
      int currentRound,
      int currentCycle,
      int currentStateProgressedSecond,
      int totalProgressedSecond});
}

/// @nodoc
class __$$TabataViewStateImplCopyWithImpl<$Res>
    extends _$TabataViewStateCopyWithImpl<$Res, _$TabataViewStateImpl>
    implements _$$TabataViewStateImplCopyWith<$Res> {
  __$$TabataViewStateImplCopyWithImpl(
      _$TabataViewStateImpl _value, $Res Function(_$TabataViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentState = null,
    Object? isPlaying = null,
    Object? isEnd = null,
    Object? currentRound = null,
    Object? currentCycle = null,
    Object? currentStateProgressedSecond = null,
    Object? totalProgressedSecond = null,
  }) {
    return _then(_$TabataViewStateImpl(
      currentState: null == currentState
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as TabataElement,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      isEnd: null == isEnd
          ? _value.isEnd
          : isEnd // ignore: cast_nullable_to_non_nullable
              as bool,
      currentRound: null == currentRound
          ? _value.currentRound
          : currentRound // ignore: cast_nullable_to_non_nullable
              as int,
      currentCycle: null == currentCycle
          ? _value.currentCycle
          : currentCycle // ignore: cast_nullable_to_non_nullable
              as int,
      currentStateProgressedSecond: null == currentStateProgressedSecond
          ? _value.currentStateProgressedSecond
          : currentStateProgressedSecond // ignore: cast_nullable_to_non_nullable
              as int,
      totalProgressedSecond: null == totalProgressedSecond
          ? _value.totalProgressedSecond
          : totalProgressedSecond // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TabataViewStateImpl
    with DiagnosticableTreeMixin
    implements _TabataViewState {
  const _$TabataViewStateImpl(
      {this.currentState = TabataElement.preparationTime,
      this.isPlaying = false,
      this.isEnd = false,
      this.currentRound = 1,
      this.currentCycle = 1,
      this.currentStateProgressedSecond = 0,
      this.totalProgressedSecond = 0});

  factory _$TabataViewStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$TabataViewStateImplFromJson(json);

  @override
  @JsonKey()
  final TabataElement currentState;
  @override
  @JsonKey()
  final bool isPlaying;
  @override
  @JsonKey()
  final bool isEnd;
  @override
  @JsonKey()
  final int currentRound;
  @override
  @JsonKey()
  final int currentCycle;
  @override
  @JsonKey()
  final int currentStateProgressedSecond;
  @override
  @JsonKey()
  final int totalProgressedSecond;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TabataViewState(currentState: $currentState, isPlaying: $isPlaying, isEnd: $isEnd, currentRound: $currentRound, currentCycle: $currentCycle, currentStateProgressedSecond: $currentStateProgressedSecond, totalProgressedSecond: $totalProgressedSecond)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TabataViewState'))
      ..add(DiagnosticsProperty('currentState', currentState))
      ..add(DiagnosticsProperty('isPlaying', isPlaying))
      ..add(DiagnosticsProperty('isEnd', isEnd))
      ..add(DiagnosticsProperty('currentRound', currentRound))
      ..add(DiagnosticsProperty('currentCycle', currentCycle))
      ..add(DiagnosticsProperty(
          'currentStateProgressedSecond', currentStateProgressedSecond))
      ..add(
          DiagnosticsProperty('totalProgressedSecond', totalProgressedSecond));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TabataViewStateImpl &&
            (identical(other.currentState, currentState) ||
                other.currentState == currentState) &&
            (identical(other.isPlaying, isPlaying) ||
                other.isPlaying == isPlaying) &&
            (identical(other.isEnd, isEnd) || other.isEnd == isEnd) &&
            (identical(other.currentRound, currentRound) ||
                other.currentRound == currentRound) &&
            (identical(other.currentCycle, currentCycle) ||
                other.currentCycle == currentCycle) &&
            (identical(other.currentStateProgressedSecond,
                    currentStateProgressedSecond) ||
                other.currentStateProgressedSecond ==
                    currentStateProgressedSecond) &&
            (identical(other.totalProgressedSecond, totalProgressedSecond) ||
                other.totalProgressedSecond == totalProgressedSecond));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentState,
      isPlaying,
      isEnd,
      currentRound,
      currentCycle,
      currentStateProgressedSecond,
      totalProgressedSecond);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TabataViewStateImplCopyWith<_$TabataViewStateImpl> get copyWith =>
      __$$TabataViewStateImplCopyWithImpl<_$TabataViewStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TabataViewStateImplToJson(
      this,
    );
  }
}

abstract class _TabataViewState implements TabataViewState {
  const factory _TabataViewState(
      {final TabataElement currentState,
      final bool isPlaying,
      final bool isEnd,
      final int currentRound,
      final int currentCycle,
      final int currentStateProgressedSecond,
      final int totalProgressedSecond}) = _$TabataViewStateImpl;

  factory _TabataViewState.fromJson(Map<String, dynamic> json) =
      _$TabataViewStateImpl.fromJson;

  @override
  TabataElement get currentState;
  @override
  bool get isPlaying;
  @override
  bool get isEnd;
  @override
  int get currentRound;
  @override
  int get currentCycle;
  @override
  int get currentStateProgressedSecond;
  @override
  int get totalProgressedSecond;
  @override
  @JsonKey(ignore: true)
  _$$TabataViewStateImplCopyWith<_$TabataViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
