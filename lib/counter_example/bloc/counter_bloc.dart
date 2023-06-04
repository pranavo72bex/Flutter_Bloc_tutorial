import 'package:bloc/bloc.dart';
import 'package:bloc_example/counter_example/bloc/counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitialState()) {
    on<CounterIncrementEvent>((event, emit) {
      emit(CounterIncrementState(state.counter + 1));
    });
    on<CounterDecrementEvent>((event, emit) {
      emit(CounterDecrementState(state.counter - 1));
    });
  }
}
