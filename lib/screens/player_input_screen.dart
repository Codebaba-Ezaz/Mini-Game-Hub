import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/player_info_provider.dart';
import 'toss_screen.dart';

class PlayerInputScreen extends ConsumerWidget {
  const PlayerInputScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player1Controller = TextEditingController();
    final player2Controller = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Enter Player Names"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _playerField("Player 1", player1Controller),
            const SizedBox(height: 20),
            _playerField("Player 2", player2Controller),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                final name1 = player1Controller.text.trim();
                final name2 = player2Controller.text.trim();

                if (name1.isEmpty || name2.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please enter both names")),
                  );
                  return;
                }

                ref.read(player1NameProvider.notifier).state = name1;
                ref.read(player2NameProvider.notifier).state = name2;

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const TossScreen()),
                );
              },
              child: const Text("Start Toss"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _playerField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
