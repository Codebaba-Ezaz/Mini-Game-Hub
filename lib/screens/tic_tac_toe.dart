import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/tic_tac_toe_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class TicTacToeGame extends ConsumerWidget {
  const TicTacToeGame({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final board = ref.watch(ticTacToeProvider);
    final gameNotifier = ref.read(ticTacToeProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Tic Tac Toe", style: GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Glassmorphism Board Container
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: 9,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => gameNotifier.playMove(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: board[index] == "X" ? Colors.blueAccent.withOpacity(0.5) : board[index] == "O" ? Colors.redAccent.withOpacity(0.5) : Colors.transparent,
                      border: Border.all(color: Colors.white.withOpacity(0.4), width: 2),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: board[index].isNotEmpty ? [
                        BoxShadow(
                          color: board[index] == "X" ? Colors.blueAccent.withOpacity(0.8) : Colors.redAccent.withOpacity(0.8),
                          blurRadius: 15,
                          spreadRadius: 2,
                        ),
                      ] : [],
                    ),
                    child: Center(
                      child: Text(
                        board[index],
                        style: GoogleFonts.montserrat(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: board[index] == "X" ? Colors.blueAccent : Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          // Restart Button
          ElevatedButton(
            onPressed: gameNotifier.resetGame,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white.withOpacity(0.2),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shadowColor: Colors.blueAccent.withOpacity(0.6),
              elevation: 10,
            ),
            child: Text("Restart", style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
