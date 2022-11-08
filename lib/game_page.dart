// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:my_own/dialog_box.dart';
import 'package:my_own/game_button.dart';

class Game_Page extends StatefulWidget {
  const Game_Page({super.key});

  @override
  State<Game_Page> createState() => _Game_PageState();
}

class _Game_PageState extends State<Game_Page> {
  late List<GameBtn> btnlst;
  var player1;
  var player2;
  var active_player;

  @override
  void initState() {
    super.initState();
    btnlst = doInit();
  }

  List<GameBtn> doInit() {
    player1 = [];
    player2 = [];
    active_player = 1;

    var gmebtn = <GameBtn>[
      GameBtn(id: 1),
      GameBtn(id: 2),
      GameBtn(id: 3),
      GameBtn(id: 4),
      GameBtn(id: 5),
      GameBtn(id: 6),
      GameBtn(id: 7),
      GameBtn(id: 8),
      GameBtn(id: 9),
    ];
    return gmebtn;
  }

  void playgame(GameBtn gb) {
    setState(() {
      if (active_player == 1) {
        gb.text = "X";
        gb.bg = Colors.green.shade100;
        player1.add(gb.id);
        active_player = 2;
      } else {
        gb.text = "O";
        gb.bg = Colors.deepPurple;
        active_player = 1;
        player2.add(gb.id);
      }
      gb.enable = false;
      checkwinner();
    });
  }

  void checkwinner() {
    var winner = -1;
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      winner = 2;
    }

    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }

    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }

    //col
    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }

    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }

    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }
    // diagonal

    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }

    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }
    if (winner != -1) {
      if (winner == 1) {
        showDialog(
            context: context,
            builder: (_) => custom_dialog("Player 1 WON",
                "press reset button to start again", resetGame));
      }
      else {
        showDialog(
            context: context,
            builder: (_) => custom_dialog("Player 2 WON",
                "press reset button to start again", resetGame));
      }
    }
  }

  void resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      btnlst = doInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("TIC TAC TOE "),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  // ignore: prefer_const_literals_to_create_immutables
                  colors: [
                Color(0xFF00061a),
                Color(0xFF001456),

                // Color(0xFF4169e8)
              ])),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 175, 15, 50),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemCount: btnlst.length,
              itemBuilder: (context, index) => SizedBox(
                width: 100,
                height: 100,
                child: ElevatedButton(
                    onPressed: btnlst[index].enable
                        ? () => playgame(btnlst[index])
                        : null,
                    // ignore: sort_child_properties_last
                    child: Text(
                      btnlst[index].text,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(btnlst[index].bg))
                    // color:btnlst[index].bg
                    ),
              ),
            ),
          ),
        ));
  }
}
