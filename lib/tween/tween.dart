import 'package:flutter/material.dart';

class TweenExample extends StatefulWidget {
  const TweenExample({super.key});

  @override
  State<TweenExample> createState() => _TweenExampleState();
}

class _TweenExampleState extends State<TweenExample> with SingleTickerProviderStateMixin {
  late Animation<double> textSizeAnimation;
  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    textSizeAnimation = Tween<double>(begin: 40.0, end: 320.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.elasticInOut,
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tween',
            ),
          ],
        ),
      ),
      body: Center(
        child: ValueListenableBuilder(
            valueListenable: textSizeAnimation,
            builder: (_, textSize, __) {
              return Image.network(
                height: textSize,
                width: textSize,
                'https://pokemon.gishan.cc/static/i/pokemon/bulbasaur.png',
              );
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 200,
        child: ValueListenableBuilder(
            valueListenable: textSizeAnimation,
            builder: (_, __, ___) {
              return FloatingActionButton(
                  foregroundColor: Colors.white,
                  backgroundColor: animationController.isAnimating ? Colors.grey : Colors.blue,
                  isExtended: true,
                  onPressed: () {
                    if (animationController.isAnimating) return;
                    if (animationController.isCompleted) {
                      animationController.reverse();
                    } else {
                      animationController.forward();
                    }
                  },
                  child: Text(animationController.isAnimating
                      ? 'Loading'
                      : animationController.isCompleted
                          ? 'Decrease'
                          : 'Increase'));
            }),
      ),
    );
  }
}
