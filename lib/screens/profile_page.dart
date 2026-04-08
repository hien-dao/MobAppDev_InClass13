import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class ProfilePage extends StatefulWidget {
  final String name;

  const ProfilePage({super.key, required this.name});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 3));
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello, ${widget.name}!',
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hello, ${widget.name}!',
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Text(
                  'You have successfully signed up for the Cash Money App!',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            )
          ),
          ConfettiWidget(
            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: false,
            colors: const [Colors.green, Colors.blue, Colors.pink, Colors.orange, Colors.purple],
          ),
        ],
      ),
    );
  }
}