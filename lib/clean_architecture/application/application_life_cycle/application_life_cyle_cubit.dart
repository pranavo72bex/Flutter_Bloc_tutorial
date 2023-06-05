import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'application_life_cyle_state.dart';
part 'application_life_cyle_cubit.freezed.dart';

@lazySingleton
class ApplicationLifeCyleCubit extends Cubit<ApplicationLifeCyleState>
    with WidgetsBindingObserver {
  ApplicationLifeCyleCubit() : super(const ApplicationLifeCyleState.initial()) {
    WidgetsBinding.instance.addObserver(this);
  }
  @override
  Future<void> close() {
    WidgetsBinding.instance.removeObserver(this);
    return super.close();
  }

  void didChangeAppLifecyleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      emit(const ApplicationLifeCyleState.resumed());
    } else if (state == AppLifecycleState.detached) {
      emit(const ApplicationLifeCyleState.detached());
    } else if (state == AppLifecycleState.paused) {
      emit(const ApplicationLifeCyleState.paused());
    }
  }
}
