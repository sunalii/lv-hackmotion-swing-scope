import 'package:equatable/equatable.dart';
import '../models/swing_capture.dart';

class SwingState extends Equatable {
  final List<SwingCapture> captures;
  final int selectedIndex;

  const SwingState({required this.captures, required this.selectedIndex});

  bool get hasNext => selectedIndex < captures.length - 1;

  bool get hasPrevious => selectedIndex > 0;

  SwingCapture? get current =>
      captures.isNotEmpty ? captures[selectedIndex] : null;

  bool get isEmpty => captures.isEmpty;

  SwingState copyWith({List<SwingCapture>? captures, int? selectedIndex}) {
    return SwingState(
      captures: captures ?? this.captures,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  List<Object?> get props => [captures, selectedIndex];
}
