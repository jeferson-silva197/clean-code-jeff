import 'package:comercio_clean_architecture/app/modules/auth/presenter/stores/auth_store.dart';
import 'package:comercio_clean_architecture/app/modules/auth/presenter/widgets/body_widget.dart';
import 'package:comercio_clean_architecture/app/modules/auth/presenter/widgets/footer_widget.dart';
import 'package:comercio_clean_architecture/app/modules/auth/presenter/widgets/head_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends ModularState<AuthPage, AuthStore> {
  @override
  void initState() {
    store.observer(
        onState: (state) => Modular.to.pushNamed('/home'),
        onError: (error) => Future.delayed(Duration.zero, () {
              if (error.isNotEmpty)
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('${store.error}'),
                  duration: const Duration(seconds: 3),
                ));
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScopedBuilder(
      store: store,
      onState: (_, store) => Column(
        children: [HeaderWidget(), BodyWidget(), Footer()],
      ),
    ));
  }
}
