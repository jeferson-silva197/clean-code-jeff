import 'package:comercio_clean_architecture/app/modules/auth/presenter/stores/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class BodyWidget extends StatefulWidget {
  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends ModularState<BodyWidget, AuthStore> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Entre com sua conta!",
            style: TextStyle(fontSize: 18, color: Colors.grey[800]),
            textAlign: TextAlign.left,
          ),
          TextField(
            decoration: InputDecoration(icon: Icon(Icons.mail)),
            onChanged: store.bodyValidationStore.setEmail,
          ),
          TextField(
              onChanged: store.bodyValidationStore.setPassword,
              decoration: InputDecoration(icon: Icon(Icons.lock))),
          SizedBox(
            height: 60,
          ),
          Center(
            child: RxBuilder(
                builder: (_) => ElevatedButton(
                      child: Text('Login'),
                      onPressed: store.bodyValidationStore.isValidate
                          ? () {
                              store.authenticate();
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          padding: EdgeInsets.symmetric(
                              horizontal: 100, vertical: 20),
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    )),
          ),
        ],
      ),
    );
  }
}
