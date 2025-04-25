import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/player_info_provider.dart';
import 'tic_tac_toe.dart';

class ColorSelectionScreen extends ConsumerWidget {
  const ColorSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final winner = ref.watch(tossWinnerProvider);
    final color1 = Colors.cyanAccent;
    final color2 = Colors.pinkAccent;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Select Your Color"),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$winner, choose your symbol color",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              shadows: [Shadow(blurRadius: 10, color: Colors.blueAccent)],
            ),
          ),
          const SizedBox(height: 40),

          // Two color choice buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _colorButton(context, ref, color1),
              _colorButton(context, ref, color2),
            ],
          )
        ],
      ),
    );
  }

  Widget _colorButton(BuildContext context, WidgetRef ref, Color color) {
    return GestureDetector(
      onTap: () {
        ref.read(playerSymbolColorProvider.notifier).state = color;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const TicTacToeGame()),
        );
      },
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.7),
              blurRadius: 20,
              spreadRadius: 5,
            )
          ],
        ),
        child: const Center(
          child: Text(
            "Pick",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
