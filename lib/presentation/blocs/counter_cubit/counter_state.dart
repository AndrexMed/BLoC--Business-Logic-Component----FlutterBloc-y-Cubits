part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counterValue;
  final int transactionCount;

  const CounterState({this.counterValue = 0, this.transactionCount = 0});

  copyWith({
    int? counterValue = 0,
    int? transactionCount = 0,
  }) =>
      CounterState(
        counterValue: counterValue ?? this.counterValue,
        transactionCount: transactionCount ?? this.transactionCount,
      );

  @override
  List<Object?> get props => [counterValue];
}
