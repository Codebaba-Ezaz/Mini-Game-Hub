import 'package:flutter/material.dart';
import 'tic_tac_toe.dart';
import 'snake_game.dart';
import 'wordy_wordy.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Mini Game Hub')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GameButton(title: "Tic Tac Toe", screen: const TicTacToe()),
          GameButton(title: "Snake Game", screen: const SnakeGame()),
          GameButton(title: "Wordy Wordy", screen: const WordyWordy()),
          ],
        )
      ),
    );
  }
}

class GameButton extends StatelessWidget {
  final String title;
  final Widget screen;

  const GameButton({super.key, required this.title, required this.screen});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        child: Text(title, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}