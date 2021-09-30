import 'package:comercio_clean_architecture/app/modules/business/presenter/widgets/business_information_widget.dart';
import 'package:comercio_clean_architecture/app/modules/business/presenter/widgets/menu_body_widget.dart';
import 'package:flutter/material.dart';

class BusinessPage extends StatefulWidget {
  const BusinessPage({Key? key}) : super(key: key);

  @override
  _BusinessPageState createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BusinessInformationWidget(),
          Divider(
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Cardapio',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          MenuBodyWidget()
        ],
      ),
    );
  }
}
