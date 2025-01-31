// DicePrep.dart

// Jenn Hoffman
// 
// 

import 'dart:math';
import "package:flutter/material.dart";

void main() // 23
{
  runApp(Dice());
}

class Dice extends StatelessWidget {
  Dice({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dice",
      home: DiceHome(),
    );
  }
}

class DiceHome extends StatefulWidget {
  @override
  State<DiceHome> createState() => DiceHomeState();
}

class DiceHomeState extends State<DiceHome> {
  // holds the current roll
  int diceValue = 1;

  // generate a random dice roll
  void rollDice() {
    setState(() {
      diceValue = Random().nextInt(6) + 1; // Random number between 1 and 6
    });
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("dice")),
      body: Center(  // center everything inside the body
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,  // centers horizontally as well
          children: [
            const Text(
              "roll the dice! :)",
              style: TextStyle(
                fontSize: 35,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 20),
            // Dice box with the rolled number
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 4, color: Colors.black),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                "$diceValue",
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Button to roll the dice
            ElevatedButton(
              onPressed: rollDice,
              child: const Text("roll dice"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}