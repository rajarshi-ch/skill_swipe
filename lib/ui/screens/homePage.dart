import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'hoho',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
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
                    onTap: () => {},
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
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  showoptions = !showoptions;
                });
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            )
          ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
