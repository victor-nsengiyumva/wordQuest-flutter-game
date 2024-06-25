import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordquest/src/features/game/controllers/current_word_state_notifier.dart';
import 'package:wordquest/src/features/utils/constants.dart';
import 'package:wordquest/src/features/utils/main_button.dart';
import 'package:wordquest/src/features/utils/profile_widget.dart';
import 'package:wordquest/src/features/utils/text_field_custom.dart';

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({super.key});

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  final wordInputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Map currentWordState = ref.watch(currentWordControllerProvider);
    String actualWord = currentWordState['word'];
    String category = currentWordState["category"];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
            margin: EdgeInsets.only(left: 5, top: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Constants.primaryColor)),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: Text('0'),
            )),
        actions: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  backgroundColor: Colors.white,
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      height: 160,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Container(
                              height: 60,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: [
                                    Text("Score : 100"),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Spacer(),
                                    TextButton(
                                      child: Text(
                                        "Reset",
                                        style: TextStyle(
                                            color: Constants.primaryColor,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () {},
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Container(
                              height: 60,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [Text("name"), Text("email")],
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: InkWell(
                                        onTap: () {},
                                        child: Icon(
                                          Icons.logout,
                                          color: Colors.red,
                                          size: 30,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: ProfileWidget(firstLetter: "v"),
            ),
          )
        ],
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
                                      RichText(
                                          textScaler: TextScaler.linear(1.1),
                                          text: TextSpan(
                                              text: "I am thinking of a ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w400),
                                              children: [
                                                TextSpan(
                                                    text:
                                                        "${actualWord.length} letter ",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF082163),
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                TextSpan(
                                                  text: "word. It starts with",
                                                ),
                                                TextSpan(
                                                    text:
                                                        " ${actualWord[0].toUpperCase()} ",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF082163),
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                TextSpan(
                                                  text: "and ends with",
                                                ),
                                                TextSpan(
                                                    text:
                                                        " ${actualWord[actualWord.length - 1].toUpperCase()}. ",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF082163),
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                TextSpan(
                                                  text:
                                                      "The word falls under the",
                                                ),
                                                TextSpan(
                                                    text: " ${category} ",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF082163),
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                TextSpan(
                                                  text:
                                                      "category. Can you guess the word?",
                                                ),
                                              ])),
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
