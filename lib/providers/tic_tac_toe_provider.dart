import 'package:flutter_riverpod/flutter_riverpod.dart';

final ticTacToeProvider = StateNotifierProvider<TicTacToeNotifier, List<String>>((ref) {
  return TicTacToeNotifier();
});

class TicTacToeNotifier extends StateNotifier<List<String>> {
  TicTacToeNotifier() : super(List.filled(9, ""));

  bool isXTurn = true;

  void playMove(int index) {
    if (state[index] == "" && checkWinner() == null) {
      state = [...state]..[index] = isXTurn ? "X" : "O";
      isXTurn = !isXTurn;
    }
  }

  void resetGame() {
    state = List.filled(9, "");
    isXTurn = true;
  }

  // Check if there's a winner
  String? checkWinner() {
    List<List<int>> winPatterns = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
      [0, 4, 8], [2, 4, 6], // Diagonals
    ];

    for (var pattern in winPatterns) {
      if (state[pattern[0]] != "" &&
          state[pattern[0]] == state[pattern[1]] &&
          state[pattern[1]] == state[pattern[2]]) {
        return state[pattern[0]];
      }
    }
    return null;
  }
}
