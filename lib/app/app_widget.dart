import 'package:comercio_clean_architecture/app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'JL Delivery', theme: AppTheme.get).modular();
  }
}
