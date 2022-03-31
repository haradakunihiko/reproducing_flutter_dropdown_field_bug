import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class MyState with _$MyState {
  MyState._();
  factory MyState({
    required int value,
  }) = _MyState;

  late final list = [1, 2, 3];
}
