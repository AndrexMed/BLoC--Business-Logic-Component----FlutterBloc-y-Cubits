import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    // on<CounterEvent>((event, emit) {

    // });

    on<Increment>(_onCounterIncreased);
    on<Decrement>(_onCounterDecremented);
    on<Multiply>(_onCounterMultiplied);
    on<Reset>(_onCounterReset);
    // on<Increment>(
    //   (event, emit) => _onCounterIncreased(event, emit),
    // ); Esta funcion es igual a la de arriba.
  }

  void _onCounterIncreased(
    Increment event,
    Emitter<CounterState> emit,
  ) {
    emit(state.copyWith(
      counterValue: state.counterValue + event.value,
      transactionCount: state.transactionCount + 1,
    ));
  }

  void _onCounterDecremented(
    Decrement event,
    Emitter<CounterState> emit,
  ) {
    emit(state.copyWith(
      counterValue: state.counterValue - event.value,
      transactionCount: state.transactionCount + 1,
    ));
  }

  void _onCounterMultiplied(
    Multiply event,
    Emitter<CounterState> emit,
  ) {
    emit(state.copyWith(
      counterValue: state.counterValue * event.value,
      transactionCount: state.transactionCount + 1,
    ));
  }

  void _onCounterReset(
    Reset event,
    Emitter<CounterState> emit,
  ) {
    emit(state.copyWith(
      counterValue: 0,
      transactionCount: state.transactionCount + 1,
    ));
  }
}
