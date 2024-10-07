part of 'counter_bloc.dart';

abstract class CounterEvent {
  const CounterEvent();
}

class Increment extends CounterEvent {
  final int value;

  const Increment(this.value);
}

class Decrement extends CounterEvent {
  final int value;

  const Decrement(this.value);
}

class Multiply extends CounterEvent {
  final int value;

  const Multiply(this.value);
}

class Reset extends CounterEvent {}