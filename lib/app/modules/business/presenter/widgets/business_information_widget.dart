import 'package:comercio_clean_architecture/app/modules/business/domain/entities/business_entity.dart';
import 'package:comercio_clean_architecture/app/modules/business/presenter/stores/bussiness_store.dart';
import 'package:comercio_clean_architecture/app/shared/errors/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class BusinessInformationWidget extends StatefulWidget {
  const BusinessInformationWidget({Key? key}) : super(key: key);

  @override
  _BusinessInformationWidgetState createState() =>
      _BusinessInformationWidgetState();
}

class _BusinessInformationWidgetState
    extends ModularState<BusinessInformationWidget, BusinessStore> {
  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<BusinessStore, Failure, BusinessEntity>(
      store: store,
      onLoading: (_) => CircularProgressIndicator(),
      onError: (_, error) => Text('$error'),
      onState: (_, model) => Container(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                child: Image.network(
                  model.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(model.description, style: TextStyle(fontSize: 14))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
