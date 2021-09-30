import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Container(
        height: 120,
        width: 120,
        child: Image.network(
          'https://brandslogos.com/wp-content/uploads/images/large/burger-king-logo-black-and-white-1.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
