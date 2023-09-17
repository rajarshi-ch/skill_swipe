import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_swipe/app/enums.dart';
import 'package:skill_swipe/bloc/cards/cards_cubit.dart';
import 'package:skill_swipe/ui/screens/home/components/add_card_modal.dart';
import 'package:skill_swipe/ui/screens/home/components/card_renderer.dart';
import 'package:skill_swipe/ui/screens/home/components/circular_button.dart';
import 'package:skill_swipe/ui/screens/home/components/delete_confirmation.dart';
import 'package:skill_swipe/ui/screens/home/components/image_options_modal.dart';
import 'package:skill_swipe/ui/screens/preview/preview_screen.dart';
import 'package:skill_swipe/ui/widgets/card_option_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showoptions = false;

  void closeOptions() {
    setState(() {
      showoptions = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardsCubit, CardsState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<CardsCubit>(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (state.currentCard != null &&
                    state.currentCard!.cardType == CardType.card) ...[
                  CircularButton(
                    backgroundColor: Colors.green,
                    icon: Icons.image,
                    altIcon: Text(
                      "A",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    isActive: state.isTitleActive,
                    onTap: () => bloc.toggleTitle(),
                  ),
                  SizedBox(width: 8),
                  CircularButton(
                    backgroundColor: Colors.green,
                    icon: Icons.image,
                    altIcon: Text(
                      "a",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    isActive: state.isTextActive,
                    onTap: () => bloc.toggleText(),
                  ),
                  SizedBox(width: 8),
                  CircularButton(
                    backgroundColor: Colors.green,
                    icon: Icons.image,
                    isActive: state.isImagePresent,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ImageOptionsModal();
                        },
                      );
                    },
                  ),
                  SizedBox(width: 8),
                ],
                if (state.cards.isNotEmpty) ...[
                  CircularButton(
                    backgroundColor: Colors.grey,
                    icon: Icons.west,
                    isActive: true,
                    onTap: bloc.moveLeft,
                  ),
                  SizedBox(width: 8),
                  CircularButton(
                    backgroundColor: Colors.grey,
                    icon: Icons.east,
                    isActive: true,
                    onTap: bloc.moveRight,
                  ),
                  SizedBox(width: 8),
                  CircularButton(
                    backgroundColor: Colors.grey,
                    icon: Icons.copy,
                    isActive: true,
                  ),
                  SizedBox(width: 8), // Add spacing between buttons
                  CircularButton(
                    backgroundColor: Colors.red,
                    icon: Icons.delete,
                    isActive: true,
                    onTap: () => showConfirmDeleteModal(
                        context: context,
                        onDelete: () => bloc.deleteCard(),
                        text: "Are you sure you want to delete this card ?"),
                  ),
                ]
              ],
            ),
            centerTitle: true,
          ),
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                state.cards.isNotEmpty
                    ? CardRenderer(card: state.cards[state.currentIndex])
                    : Expanded(
                        child: Center(
                        child: Text("Add your first card !"),
                      )),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // FloatingActionButton(
                      //   onPressed: () {
                      //     bloc.previousCard();
                      //   },
                      //   hoverElevation: 0,
                      //   elevation: 0,
                      //   tooltip: 'Previous Card',
                      //   child: const Icon(Icons.chevron_left),
                      // ),
                      CircularButton(
                        backgroundColor: Colors.grey,
                        icon: Icons.chevron_left,
                        onTap: () {
                          bloc.previousCard();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          "${state.cards.isEmpty ? 0 : state.currentIndex + 1} / ${state.cards.length}",
                        ),
                      ),
                      CircularButton(
                        backgroundColor: Colors.grey,
                        icon: Icons.chevron_right,
                        onTap: () {
                          bloc.nextCard();
                        },
                      ),
                      // FloatingActionButton(
                      //   onPressed: () {
                      //     bloc.nextCard();
                      //   },
                      //   hoverElevation: 0,
                      //   elevation: 0,
                      //   tooltip: 'Next Card',
                      //   child: const Icon(Icons.chevron_right),
                      // ),
                      Spacer(),

                      FloatingActionButton(
                        onPressed: () {
                          // setState(() {
                          //   showoptions = !showoptions;
                          // });
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AddCardModal();
                            },
                          );
                        },
                        hoverElevation: 0,
                        elevation: 0,
                        tooltip: 'Add a new card',
                        child: const Icon(Icons.add),
                      ),
                      Spacer(),
                      SizedBox(
                        width: 8,
                      ),
                      GradientButton(
                        isActive: state.cards.isNotEmpty,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          floatingActionButton: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (showoptions)
                  Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.white,
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      CardOptionButton(
                        icon: Icons.subject,
                        title: "Card",
                        onTap: () {
                          bloc.addCard();
                          closeOptions();
                        },
                      ),
                      CardOptionButton(
                        icon: Icons.videocam_outlined,
                        title: "Video",
                        onTap: () => {},
                      ),
                      CardOptionButton(
                        icon: Icons.format_list_numbered,
                        title: "Poll",
                        onTap: () => {},
                      ),
                      CardOptionButton(
                        icon: Icons.rule,
                        title: "Quiz",
                        onTap: () => {},
                      ),
                    ]),
                  ),
              ]), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}

class GradientButton extends StatelessWidget {
  final bool isActive;

  const GradientButton({super.key, required this.isActive});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isActive) Navigator.of(context).push(StoryScreen.route());
      },
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          gradient: isActive
              ? LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.green
                  ], // Replace with your gradient colors
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isActive ? null : Colors.grey,
          borderRadius:
              BorderRadius.circular(25), // Adjust corner radius as needed
        ),
        child: Center(
          child: Text(
            'Preview',
            style: TextStyle(
              color: Colors.white, // Text color
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
