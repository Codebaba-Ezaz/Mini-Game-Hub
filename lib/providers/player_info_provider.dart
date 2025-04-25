import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final player1NameProvider = StateProvider<String>((ref) => '');
final player2NameProvider = StateProvider<String>((ref) => '');
final tossWinnerProvider = StateProvider<String>((ref) => '');
final playerSymbolColorProvider = StateProvider<Color>((ref) => Colors.cyanAccent);
