// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print
import 'package:flutter/material.dart';

var messages;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // to add icon image

  var cross = Icon(
    Icons.cancel,
    size: 80,
  );
  var circle = Icon(
    Icons.circle,
    size: 80,
  );
  var edit = Icon(Icons.edit, size: 80);

  bool isCross = true;
  late String message;
  late List<String> gameState;
  // initialize box with empty value

  @override
  void initState() {
    gameState = List.filled(9, "empty");
    this.message = "";
    super.initState();
  }

  // to play game
  playGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "cross";
        } else {
          this.gameState[index] = "circle";
        }
        isCross = !isCross;
        checkWin();
      });
    }
  }

  resetGame() {
    setState(() {
      gameState = List.filled(9, "empty");
      this.message = "";
    });
  }

  //to get icon images
  getIcon(String title) {
    switch (title) {
      case ('empty'):
        return edit;

      case ('cross'):
        return cross;

      case ('circle'):
        return circle;
    }
  }

  // to check for winnings

  checkWin() {
    if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        messages = this.gameState[0] + " Player Is a Winner";
      });
      showAlertDialog(context);
      resetGame();
    } else if ((gameState[3] != "empty") &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        messages = this.gameState[3] + " Player Is a Winner";
      });
      showAlertDialog(context);
      resetGame();
    } else if ((gameState[6] != "empty") &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        messages = this.gameState[6] + " Player Is a Winner";
      });
      showAlertDialog(context);
      resetGame();
    } else if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        messages = this.gameState[0] + " Player Is a Winner";
      });
      showAlertDialog(context);
      resetGame();
    } else if ((gameState[1] != "empty") &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        messages = this.gameState[1] + " Player Is a Winner";
      });
      showAlertDialog(context);
      resetGame();
    } else if ((gameState[2] != "empty") &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        messages = this.gameState[2] + " Player Is a Winner";
      });
      showAlertDialog(context);
      resetGame();
    } else if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        messages = this.gameState[0] + " Player Is a Winner";
      });
      showAlertDialog(context);
      resetGame();
    } else if ((gameState[2] != "empty") &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        messages = this.gameState[2] + " Player Is a Winner";
      });
      showAlertDialog(context);
      resetGame();
    } else if (!gameState.contains("empty")) {
      setState(() {
        messages = "Game Draw";
      });
      showAlertDialog(context);
      resetGame();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIK TAK TOE"),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: GridView.builder(
                    padding: EdgeInsets.all(10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.0,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemCount: gameState.length,
                    itemBuilder: (context, i) => SizedBox(
                          width: 100,
                          height: 100,
                          child: MaterialButton(
                              onPressed: () {
                                this.playGame(i);
                              },
                              child: getIcon(this.gameState[i])),
                        ))),
            Text(
              message,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () => resetGame(),
              child: Text("Reset Game"),
            )
          ]),
    );
  }
}

class MyAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        child: Text('Please Enter The Items'),
        onPressed: () {
          showAlertDialog(context);
        },
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text("Result"),
    content: Text(messages),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
