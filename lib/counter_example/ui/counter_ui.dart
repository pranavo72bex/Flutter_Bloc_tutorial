import 'package:bloc_example/counter_example/bloc/counter_bloc.dart';
import 'package:bloc_example/counter_example/bloc/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_state.dart';

class CounterExample extends StatelessWidget {
  const CounterExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocSelector<CounterBloc, CounterState, bool>(
              selector: (state) => state.counter > 4 ? true : false,
              builder: (context, state) {
                return Container(
                  height: 100,
                  width: 100,
                  color: state ? Colors.red : Colors.amber,
                );
              }),
          const SizedBox(
            height: 50,
          ),
          BlocConsumer<CounterBloc, CounterState>(builder: (context, state) {
            return Text("value ${state.counter}");
          }, listener: (context, state) {
            if (state.counter > 5) {
              print(" I am from BlocConsumer");
            }
          }),
          const SizedBox(
            height: 50,
          ),
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text(state.counter.toString());
            },
          ),
          const SizedBox(
            height: 50,
          ),
          BlocListener<CounterBloc, CounterState>(
            listener: (context, state) {
              if (state.counter >= 5) {
                print('I am from BlocListener');
              }
            },
            child: const Text('Test'),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterIncrementEvent());
                },
                child: const Icon(Icons.add),
              ),
              const SizedBox(
                width: 50,
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterDecrementEvent());
                },
                child: const Icon(Icons.remove),
              )
            ],
          )
        ],
      ),
    );
  }
}

// Import Statements:
// dart

// import 'package:bloc_example/counter_example/bloc/counter_bloc.dart';
// import 'package:bloc_example/counter_example/bloc/counter_event.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// These are the import statements required for the code. It includes the necessary packages and files for BLoC implementation.

// Class Definition:
// dart

// class CounterExample extends StatelessWidget {
//   const CounterExample({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Widget implementation
//   }
// }
// This class CounterExample is a stateless widget representing the main screen of the app. It extends StatelessWidget and overrides the build method.

// Scaffold Widget:
// dart

// return Scaffold(
//   appBar: AppBar(
//     title: const Text('Bloc'),
//   ),
//   body: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       // Widget components
//     ],
//   ),
// );
// The Scaffold widget provides a basic layout structure for the app. It contains an AppBar at the top and a Column as the body, which holds the various widgets.

// BlocSelector Widget:
// dart

// BlocSelector<CounterBloc, CounterState, bool>(
//   selector: (state) => state.counter > 4 ? true : false,
//   builder: (context, state) {
//     return Container(
//       height: 100,
//       width: 100,
//       color: state ? Colors.red : Colors.amber,
//     );
//   },
// ),
// The BlocSelector widget is used to select a specific value from the state and rebuild the widget whenever that value changes. In this case, it checks if the counter value in the CounterState is greater than 4 and returns true or false accordingly. Based on the value, it renders a colored container.

// BlocConsumer Widget:
// dart

// BlocConsumer<CounterBloc, CounterState>(
//   builder: (context, state) {
//     return Text("value ${state.counter}");
//   },
//   listener: (context, state) {
//     if (state.counter > 5) {
//       print("I am from consumer");
//     }
//   },
// ),
// The BlocConsumer widget is responsible for building the UI based on the state and executing side-effects through the listener. The builder function builds the UI based on the CounterState, and the listener function is called whenever the state changes. In this example, it prints a message when the counter value exceeds 5.

// BlocBuilder Widget:
// dart

// BlocBuilder<CounterBloc, CounterState>(
//   builder: (context, state) {
//     return Text(state.counter.toString());
//   },
// ),
// The BlocBuilder widget rebuilds the UI whenever the state changes. It takes a builder function that builds the UI based on the current CounterState. In this case, it displays the counter value as a text widget.

// BlocListener Widget:
// dart

// BlocListener<CounterBloc, CounterState>(
//   listener: (context, state) {
//     if (state.counter >= 5) {
//       print('hello');
//     }
//   },
//   child: const Text('Test'),
// ),
// The BlocListener widget listens to state changes and executes side-effects based on the state. It takes a listener function that is called when the state changes. In this case