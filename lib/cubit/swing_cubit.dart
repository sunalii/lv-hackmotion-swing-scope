import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/swing_capture.dart';
import '../utils/json_loader.dart';
import 'swing_state.dart';

class SwingCubit extends Cubit<SwingState> {
  SwingCubit() : super(const SwingState(captures: [], selectedIndex: 0));

  Future<void> loadCaptures() async {
    final captures = await loadSwingCaptures();
    emit(SwingState(captures: captures, selectedIndex: 0));
  }

  void selectIndex(int index) {
    if (index >= 0 && index < state.captures.length) {
      emit(state.copyWith(selectedIndex: index));
    }
  }

  void selectNext() {
    if (state.hasNext) {
      emit(state.copyWith(selectedIndex: state.selectedIndex + 1));
    }
  }

  void selectPrevious() {
    if (state.hasPrevious) {
      emit(state.copyWith(selectedIndex: state.selectedIndex - 1));
    }
  }

  void deleteCurrent() {
    if (state.isEmpty) return;

    final updated = List<SwingCapture>.from(state.captures)
      ..removeAt(state.selectedIndex);

    int newIndex = state.selectedIndex;
    if (newIndex >= updated.length && updated.isNotEmpty) {
      newIndex = updated.length - 1;
    }

    emit(SwingState(captures: updated, selectedIndex: newIndex));
  }
}
