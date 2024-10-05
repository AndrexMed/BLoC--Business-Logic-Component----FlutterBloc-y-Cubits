import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CounterCubit(), child: const _CubitCounterView());
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  void increment(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increment(value);
  }

  void decrement(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().decrement(value);
  }

  void multiply(BuildContext context, [int value = 2]) {
    context.read<CounterCubit>().multiply(value);
  }

  void reset(BuildContext context) {
    context.read<CounterCubit>().reset();
  }

  @override
  Widget build(BuildContext context) {
    //final counterState = context.watch<CounterCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterCubit value) {
          return Text('Cubit Counter: ${value.state.transactionCount}');
        }),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              reset(context);
            },
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          // buildWhen: (previous, current) =>
          //     previous.counterValue != current.counterValue,
          builder: (context, state) {
            print('Cubit Counter Change *****');
            return Text('Cubit Counter: ${state.counterValue}');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () {
              increment(context, 2);
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () {
              decrement(context, 2);
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
              heroTag: '3',
              onPressed: () {
                multiply(context, 3);
              },
              child: const Icon(Icons.clear)),
        ],
      ),
    );
  }
}
