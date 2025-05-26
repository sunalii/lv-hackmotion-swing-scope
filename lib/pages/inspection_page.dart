import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/swing_cubit.dart';
import '../cubit/swing_state.dart';
import '../widgets/swing_graph.dart';

class InspectionPage extends StatelessWidget {
  const InspectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwingCubit, SwingState>(
      builder: (context, state) {
        if (state.isEmpty || state.current == null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted) {
              Navigator.of(context).popUntil((route) => route.isFirst);
            }
          });

          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final swing = state.current!;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Inspection'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Text(
                    'Swing ID: ${swing.id}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),

                  // Line Chart
                  Expanded(
                    child: SwingGraph(
                      swing: swing,
                      onDelete: () {
                        context.read<SwingCubit>().deleteCurrent();
                        if (context.read<SwingCubit>().state.isEmpty &&
                            context.mounted) {
                          Navigator.of(
                            context,
                          ).popUntil((route) => route.isFirst);
                        }
                      },
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Navigation + Delete Controls
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('Previous'),
                        onPressed: state.hasPrevious
                            ? () => context.read<SwingCubit>().selectPrevious()
                            : null,
                      ),
                      // ElevatedButton.icon(
                      //   icon: const Icon(Icons.delete),
                      //   label: const Text('Delete'),
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Colors.red,
                      //   ),
                      //   onPressed: () {
                      //     context.read<SwingCubit>().deleteCurrent();
                      //
                      //     // If list is now empty, go home
                      //     if (context.read<SwingCubit>().state.isEmpty) {
                      //       Navigator.of(
                      //         context,
                      //       ).popUntil((route) => route.isFirst);
                      //     }
                      //   },
                      // ),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text('Next'),
                        onPressed: state.hasNext
                            ? () => context.read<SwingCubit>().selectNext()
                            : null,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
