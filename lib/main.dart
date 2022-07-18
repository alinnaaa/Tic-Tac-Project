import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  bool onTurn = true; // the first player is O
  List<String> displayExOh = ['', '', '', '', '', '', '', '', ''];
  var myTextStyle = TextStyle(color: Colors.black, fontSize: 30);
  var ohScore = 0;
  var exScore = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.yellow[800],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              // color: Colors.black54,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Player O',
                            style: myTextStyle,
                          ),
                          Text(
                            ohScore.toString(),
                            style: myTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Player X',
                            style: myTextStyle,
                          ),
                          Text(
                            exScore.toString(),
                            style: myTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount:
                    9, //agar ama da naneit la sfrawa zhmara da anet ta infint
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3), // matrix 3 by 3
                itemBuilder: (BuildContext Context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54) //grey[700]
                          ),
                      child: Center(
                        child: Text(
                          displayExOh[index],
                          style: TextStyle(
                            // ama bo style zhmarakana
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: Container(
                // color: Colors.black54,
                ),
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (onTurn && displayExOh[index] == '') {
        displayExOh[index] = 'O';
      } else if (!onTurn && displayExOh[index] == '') {
        displayExOh[index] = 'X';
      }
      onTurn = !onTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != '') {
      _showInDialog(displayExOh[0]);
    }

    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '') {
      _showInDialog(displayExOh[3]);
    }

    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '') {
      _showInDialog(displayExOh[6]);
    }

    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '') {
      _showInDialog(displayExOh[0]);
    }

    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '') {
      _showInDialog(displayExOh[1]);
    }

    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '') {
      _showInDialog(displayExOh[2]);
    }

    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != '') {
      _showInDialog(displayExOh[0]);
    }

    if (displayExOh[6] == displayExOh[4] &&
        displayExOh[6] == displayExOh[2] &&
        displayExOh[6] != '') {
      _showInDialog(displayExOh[6]);
    }
  }

  void _showInDialog(String winner) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('WINNER! is ' + winner),
          actions: <Widget>[
            FlatButton(
              child: Text('Play Again!'),
              onPressed: _clearScore,
            ),
          ],
        );
      },
    );
    if (winner == 'o') {
      ohScore += 1;
    } else if (winner == 'x') {
      exScore += 1;
    }
    _clearScore();
  }

  void _clearScore() {}
}
