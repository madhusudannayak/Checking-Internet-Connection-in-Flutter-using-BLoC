import 'package:bloc_example/blocs/internet_bloc/internet_bloc.dart';
import 'package:bloc_example/blocs/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BloC"),
      ),
      body: Center(
        child: BlocConsumer<InternetBloc, IntenterState>(
          listener: (context, state) {
            if (state is InternetGainState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Internet connected!"),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("No Internet"),
                  backgroundColor: Colors.red,
                ),
              );
            }

          },
          builder: (context, state) {
            if (state is InternetGainState) {
              return const Text(
                "Connected..",
                style: TextStyle(fontSize: 50),
              );
            } else if (state is InternetLostState) {
              return const Text(
                "No Internet..",
                style: TextStyle(fontSize: 50),
              );
            } else {
              return const Text(
                "Loading..",
                style: TextStyle(fontSize: 50),
              );
            }
          },
        ),
      ),
    );
  }
}
