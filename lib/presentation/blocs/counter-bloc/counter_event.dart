part of 'counter_bloc.dart';

abstract class CounterEvent {
  const CounterEvent();
}

class Increment extends CounterEvent {
  final int value;

  const Increment(this.value);
}
