import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const CricketApp());
}

class CricketApp extends StatelessWidget {
  const CricketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Cricket',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CricketHomePage(),
    );
  }
}

class CricketHomePage extends StatefulWidget {
  const CricketHomePage({super.key});

  @override
  State<CricketHomePage> createState() => _CricketHomePageState();
}

class _CricketHomePageState extends State<CricketHomePage> {
  int runs = 0;
  int balls = 0;

  final Random random = Random();

  void playBall() {
    if (balls >= 6) {
      return;
    }

    int score = random.nextInt(7);

    setState(() {
      runs += score;
      balls++;
    });
  }

  void restartGame() {
    setState(() {
      runs = 0;
      balls = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool gameOver = balls >= 6;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini Cricket'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Container(
        width: double.infinity,
        color: Colors.blue[700],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Column(
                  children: [
                    Image.asset(
                      'assets/bat.png',
                      width: 120,
                      height: 120,
                    ),
                    const Text(
                      'Runs',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$runs',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(width: 30),

                Column(
                  children: [
                    Image.asset(
                      'assets/ball.png',
                      width: 120,
                      height: 120,
                    ),
                    const Text(
                      'Balls',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$balls',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 30),

            Text(
              gameOver ? 'Game Over' : 'Ready to Bat!',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: gameOver ? restartGame : playBall,
              child: Text(
                gameOver ? 'Restart' : 'Bat',
              ),
            ),
          ],
        ),
      ),
    );
  }
}