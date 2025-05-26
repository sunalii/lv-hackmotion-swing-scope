import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/swing_cubit.dart';
import '../cubit/swing_state.dart';
import 'inspection_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: BlocBuilder<SwingCubit, SwingState>(
        builder: (context, state) {
          if (state.isEmpty) {
            return const Center(child: Text('No swings available'));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: state.captures.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final swing = state.captures[index];

              return ListTile(
                tileColor: Colors.grey[200],
                title: Text('Swing ${index + 1}'),
                subtitle: Text('Capture ID: ${swing.id}'),
                trailing: const Icon(Icons.arrow_forward_ios),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onTap: () {
                  context.read<SwingCubit>().selectIndex(index);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const InspectionPage()),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
