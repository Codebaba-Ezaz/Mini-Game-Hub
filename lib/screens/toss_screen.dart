import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/player_info_provider.dart';
import 'color_selection_screen.dart';

class TossScreen extends ConsumerStatefulWidget {
  const TossScreen({super.key});

  @override
  ConsumerState<TossScreen> createState() => _TossScreenState();
}

class _TossScreenState extends ConsumerState<TossScreen> {
  String? winner;
  bool isTossed = false;

  void performToss() {
    final player1 = ref.read(player1NameProvider);
    final player2 = ref.read(player2NameProvider);

    final rand = Random();
    final tossResult = rand.nextBool();
    winner = tossResult ? player1 : player2;

    ref.read(tossWinnerProvider.notifier).state = winner!;
    setState(() {
      isTossed = true;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), performToss);
  }

  @override
  Widget build(BuildContext context) {
    final player1 = ref.watch(player1NameProvider);
    final player2 = ref.watch(player2NameProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: isTossed
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$winner won the toss!',
              style: TextStyle(
                color: Colors.greenAccent,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                shadows: [
                  const Shadow(blurRadius: 10, color: Colors.purpleAccent),
                ],
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyanAccent,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ColorSelectionScreen()),
                );
              },
              child: const Text(
                'Select Color',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        )
            : const CircularProgressIndicator(
          color: Colors.cyanAccent,
        ),
      ),
    );
  }
}
