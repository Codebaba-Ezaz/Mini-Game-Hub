import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tic_tac_toe.dart';
import 'snake_game.dart';
import 'wordy_wordy.dart';
import 'player_input_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
           AnimatedBackground(),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Text(
                "Mini Game Hub",
                style: GoogleFonts.pressStart2p(
                  fontSize: 20, // Corrected fontSize property
                  color: Colors.white,
                  shadows: [
                    Shadow(color: Colors.blueAccent, blurRadius: 10),
                    Shadow(color: Colors.purpleAccent, blurRadius: 10),
                  ],
                ),
              ),
            ),
          ),
        Center(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            padding: const EdgeInsets.all(20),
            children: [
              GameCard("Tic Tac Toe", "assets/tic_tac_toe.png",() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PlayerInputScreen()));
              }),
              GameCard("Snake Game", "assets/snake_game.png",() {
                Navigator.push(context,MaterialPageRoute(builder: (context) => const SnakeGame()));
              }),
              GameCard("WordyWordy", "assets/word_wordy.png",() {
                Navigator.push(context,MaterialPageRoute(builder: (context) => const WordScrambleGame()));
              }),

            ],
          ),
        )
        ],
      ),
    );
  }
}

Widget GameCard(String title, String imagePath, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.blueAccent.withOpacity(0.5),blurRadius: 15,spreadRadius: 2),
        ]
      ),
      child: Stack(
        children: [
          Center(
            child: Image.asset(imagePath,width: 100, height: 100, fit: BoxFit.cover)
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child:Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

// Background Animation
class AnimatedBackground extends StatefulWidget {
  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 5))..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueAccent.withOpacity(0.3 + (_controller.value * 0.3)),
                Colors.purpleAccent.withOpacity(0.3 + (_controller.value * 0.3)),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}