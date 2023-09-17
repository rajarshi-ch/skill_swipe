import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_swipe/bloc/cards/cards_cubit.dart';
import 'package:skill_swipe/models/card_model.dart';
import 'package:skill_swipe/ui/screens/preview/components/preview_card_renderer.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen();

  static MaterialPageRoute<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => StoryScreen(),
    );
  }

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _animController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animController = AnimationController(vsync: this);
    final bloc = BlocProvider.of<CardsCubit>(context);
    final CardModel firstCard = bloc.state.cards.first;
    _loadStory(card: firstCard, animateToPage: false);

    _animController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animController.stop();
        _animController.reset();
        setState(() {
          if (_currentIndex + 1 < bloc.state.cards.length) {
            _currentIndex += 1;
            _loadStory(card: bloc.state.cards[_currentIndex]);
          } else {
            // Out of bounds - loop story
            // You can also Navigator.of(context).pop() here
            _currentIndex = 0;
            _loadStory(card: bloc.state.cards[_currentIndex]);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardsCubit, CardsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: GestureDetector(
            onTapDown: (details) =>
                _onTapDown(details, state.cards[_currentIndex]),
            child: SafeArea(
              child: Stack(
                children: <Widget>[
                  PageView.builder(
                    controller: _pageController,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.cards.length,
                    itemBuilder: (context, i) {
                      final CardModel card = state.cards[i];
                      return PreviewCardRenderer(
                        card: card,
                      );
                    },
                  ),
                  Positioned(
                    top: 10.0,
                    left: 10.0,
                    right: 10.0,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            ...state.cards
                                .asMap()
                                .map((i, e) {
                                  return MapEntry(
                                    i,
                                    AnimatedBar(
                                      animController: _animController,
                                      position: i,
                                      currentIndex: _currentIndex,
                                    ),
                                  );
                                })
                                .values
                                .toList(),
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(Icons.cancel))
                          ],
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //     horizontal: 1.5,
                        //     vertical: 10.0,
                        //   ),
                        //   child: UserInfo(user: story.user),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _onTapDown(TapDownDetails details, CardModel card) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;
    final bloc = BlocProvider.of<CardsCubit>(context);
    if (dx < screenWidth / 3) {
      setState(() {
        if (_currentIndex - 1 >= 0) {
          _currentIndex -= 1;
          _loadStory(card: bloc.state.cards[_currentIndex]);
        }
      });
    } else if (dx > 2 * screenWidth / 3) {
      setState(() {
        if (_currentIndex + 1 < bloc.state.cards.length) {
          _currentIndex += 1;
          _loadStory(card: bloc.state.cards[_currentIndex]);
        } else {
          // Out of bounds - loop story
          // You can also Navigator.of(context).pop() here
          _currentIndex = 0;
          _loadStory(card: bloc.state.cards[_currentIndex]);
        }
      });
    } else {
      // if (story.media == MediaType.video) {
      //   if (_videoController.value.isPlaying) {
      //     _videoController.pause();
      //     _animController.stop();
      //   } else {
      //     _videoController.play();
      //     _animController.forward();
      //   }
      // }
    }
  }

  void _loadStory({required CardModel card, bool animateToPage = true}) {
    _animController.stop();
    _animController.reset();
    if (animateToPage) {
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }
}

class AnimatedBar extends StatelessWidget {
  final AnimationController animController;
  final int position;
  final int currentIndex;

  const AnimatedBar({
    super.key,
    required this.animController,
    required this.position,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.5),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: <Widget>[
                _buildContainer(
                  double.infinity,
                  position < currentIndex
                      ? Colors.white
                      : Colors.white.withOpacity(0.5),
                ),
                position == currentIndex
                    ? AnimatedBuilder(
                        animation: animController,
                        builder: (context, child) {
                          return _buildContainer(
                            constraints.maxWidth * animController.value,
                            Colors.white,
                          );
                        },
                      )
                    : const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
    );
  }

  Container _buildContainer(double width, Color color) {
    return Container(
      height: 5.0,
      width: width,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.black26,
          width: 0.8,
        ),
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }
}
