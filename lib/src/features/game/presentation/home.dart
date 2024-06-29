import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordquest/src/features/authentication/controller.dart/current_user_controller.dart';
import 'package:wordquest/src/features/authentication/data/user_model.dart';
import 'package:wordquest/src/features/game/controllers/current_word_state_notifier.dart';
import 'package:wordquest/src/features/game/data/game_repository.dart';
import 'package:wordquest/src/features/game/presentation/game_screen.dart';
import 'package:wordquest/src/features/utils/main_button.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool isButtonDisabled = false;
  @override
  Widget build(BuildContext context) {
    GameRepo gameRepo = GameRepo.instance;
    CurrentWordController currentWordController =
        ref.read(currentWordControllerProvider.notifier);
    UserModel currentUser = ref.watch(currentUserControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('WordQuest'),
      ),
      body: CustomScrollView(slivers: [
        SliverFillRemaining(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 340,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 90,
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
                                        "Hello ${currentUser.username}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Color(0xFF082163)),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Lets see how best you can read my mind by guessing the words I am thinking about.",
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textScaler: TextScaler.linear(1.1),
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
                    height: 60,
                  ),
                  SizedBox(
                      width: 320,
                      child: MainButton(
                          disabled: isButtonDisabled,
                          text: "Start game",
                          onpressed: () {
                            setState(() {
                              isButtonDisabled = true;
                            });

                            try {
                              Map word = gameRepo.getWord();
                              currentWordController.setNewWord(word);
                            } catch (e) {
                              print("there was an error retrieving the word");
                            }

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GameScreen()));

                            setState(() {
                              isButtonDisabled = false;
                            });
                          })),
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
