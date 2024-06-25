import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wordquest/src/features/utils/main_button.dart';
import 'package:wordquest/src/features/utils/text_field_custom.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final wordInputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WordQuest'),
      ),
      body: CustomScrollView(slivers: [
        SliverFillRemaining(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 350,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 100,
                          child: Center(
                            child: Image.asset(
                                "assets/images/game_character.png",
                                width: 250,
                                height: 250),
                          ),
                        ),
                        Positioned(
                            top: 150,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xFF082163)),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color.fromARGB(255, 223, 230, 248)),
                                width: 300,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 30, bottom: 20, top: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Play",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Color(0xFF082163)),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "I am thinking of a 3 letter word. It starts with B and ends with D. The word falls under the animal category. Can you guess the word",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: 320,
                    child: Form(
                        key: _formKey,
                        child: TextFieldCustom(
                            controller: wordInputController,
                            label: "Type the word")),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: 320,
                      child:
                          MainButton(text: "Take a guess", onpressed: () {})),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
