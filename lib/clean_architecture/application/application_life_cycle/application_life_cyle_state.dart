part of 'application_life_cyle_cubit.dart';

@freezed
class ApplicationLifeCyleState with _$ApplicationLifeCyleState {
  const factory ApplicationLifeCyleState.initial() = _Initial;
  const factory ApplicationLifeCyleState.detached() = _Detached;
  const factory ApplicationLifeCyleState.paused() = _Paused;
  const factory ApplicationLifeCyleState.resumed() = _Resumed;

  const ApplicationLifeCyleState._();
}
