// Jenn Hoffman

import 'package:flutter/material.dart';

void main() {
  runApp(Robot());
}

class Robot extends StatelessWidget {
  const Robot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Robot',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WarehouseRobotHomePage(),
    );
  }
}

class WarehouseRobotHomePage extends StatefulWidget {
  const WarehouseRobotHomePage({super.key});

  @override
  WarehouseRobotHomePageState createState() => WarehouseRobotHomePageState();
}

class WarehouseRobotHomePageState extends State<WarehouseRobotHomePage> {
  int rows = 5; // rows in the grid
  int cols = 5; // columns in the grid
  int robotRow = 0; // initial robot row position
  int robotCol = 0; // initial robot column position
  List<List<String>> grid = []; // make the grid

  @override
  void initState() {
    super.initState();
    // initialize the grid with empty spaces
    grid = List.generate(rows, (_) => List.filled(cols, ' '));
    // starting position
    grid[robotRow][robotCol] = 'R';
  }

  // move the robot within bounds
  void moveRobot(int newRow, int newCol) {
    setState(() {
      grid[robotRow][robotCol] = ' '; // Remove robot from old position
      robotRow = newRow;
      robotCol = newCol;
      grid[robotRow][robotCol] = 'R'; // Place robot at new position
    });
  }

  // widget to build the warehouse grid
  Widget buildGrid() {
    return GridView.builder(
      itemCount: rows * cols, // total number of grid cells
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: cols, // define number of columns
      ),
      itemBuilder: (context, index) {
        int row = index ~/ cols; // calculate row index using int division
        int col = index % cols; // calculate column index
        String cell = grid[row][col];

        return Container(
          margin: const EdgeInsets.all(2),
          color: cell == 'R' ? Colors.blue : Colors.grey[200],
          child: Center(
            child: Text(
              cell == 'R' ? 'R' : '', // show 'R' if it's the robot
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Robot Warehouse"),
      ),
      body: Column(
        children: [
          // Warehouse grid display
          Expanded(child: buildGrid()),

          // movement controls (Up, Down, Left, Right)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (robotRow > 0) moveRobot(robotRow - 1, robotCol);
                },
                child: const Text("Up"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (robotCol > 0) moveRobot(robotRow, robotCol - 1);
                },
                child: const Text("Left"), 
              ),
              ElevatedButton(
                onPressed: () {
                  if (robotCol < cols - 1) moveRobot(robotRow, robotCol + 1);
                },
                child: const Text("Right"), 
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (robotRow < rows - 1) moveRobot(robotRow + 1, robotCol);
                },
                child: const Text("Down"), 
              ),
            ],
          ),
        ],
      ),
    );
  }
}