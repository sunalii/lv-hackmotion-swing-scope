import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/swing_cubit.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const SwingScopeApp());
}

class SwingScopeApp extends StatelessWidget {
  const SwingScopeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SwingCubit()..loadCaptures(),
      child: MaterialApp(
        title: 'SwingScope',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
