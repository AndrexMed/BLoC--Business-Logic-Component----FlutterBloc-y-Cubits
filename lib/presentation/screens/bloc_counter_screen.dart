import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter-bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CounterBloc(), child: const _BlocCounterView());
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView();

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>().add(Increment(value));
  }

  void decreaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>().add(Decrement(value));
  }

  void multiplyCounterBy(BuildContext context, [int value = 2]) {
    context.read<CounterBloc>().add(Multiply(value));
  }

  void resetCounter(BuildContext context) {
    context.read<CounterBloc>().add(Reset());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc counterBloc) =>
            Text('Bloc Counter: ${counterBloc.state.transactionCount}')),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              resetCounter(context);
            },
          ),
        ],
      ),
      body: Center(
        child: context.select((CounterBloc counterBloc) =>
            Text('Bloc Counter: ${counterBloc.state.counterValue}')),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () {
              increaseCounterBy(context, 2);
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () {
              decreaseCounterBy(context, 2);
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
              heroTag: '3',
              onPressed: () {
                multiplyCounterBy(context, 2);
              },
              child: const Icon(Icons.clear)),
        ],
      ),
    );
  }
}
