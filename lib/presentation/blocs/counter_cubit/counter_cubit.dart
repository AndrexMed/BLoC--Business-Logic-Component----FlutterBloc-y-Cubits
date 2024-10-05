import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(counterValue: 5));

  void increment(int value) => emit(state.copyWith(
        counterValue: state.counterValue + value,
        transactionCount: state.transactionCount + 1,
      ));

  void decrement(int value) => emit(state.copyWith(
        counterValue: state.counterValue - value,
        transactionCount: state.transactionCount + 1,
      ));

  void multiply(int value) => emit(state.copyWith(
        counterValue: state.counterValue * value,
        transactionCount: state.transactionCount + 1,
      ));

  void reset() => emit(state.copyWith(
        counterValue: 0,
        transactionCount: state.transactionCount + 1,
      ));
}
