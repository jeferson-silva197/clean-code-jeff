import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../app_theme.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController animation;
  late Animation<double> _fadeInFadeOut;

  splashScreenPage() async {
    Future.delayed(Duration(seconds: 1))
        .whenComplete(() => Modular.to.pushNamed("/authenticate"));
  }

  @override
  void initState() {
    splashScreenPage();
    animationController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: ColorsTheme.primaryColor,
        child: FadeTransition(
          opacity: _fadeInFadeOut,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                child: Image.network(
                  'https://brandslogos.com/wp-content/uploads/images/large/burger-king-logo-black-and-white-1.png',
                  scale: 0.5,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                "App Code",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontFamily: "Raleway",
                    shadows: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(4, 4),
                        blurRadius: 6,
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  animationController() {
    animation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(animation);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animation.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animation.forward();
      }
    });
    animation.forward();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }
}
