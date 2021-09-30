import 'package:comercio_clean_architecture/app/modules/business/domain/entities/menu_entity.dart';
import 'package:comercio_clean_architecture/app/modules/business/presenter/stores/menu_store.dart';
import 'package:comercio_clean_architecture/app/modules/business/presenter/widgets/menu_item_widget.dart';
import 'package:comercio_clean_architecture/app/shared/errors/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class MenuBodyWidget extends StatefulWidget {
  const MenuBodyWidget({Key? key}) : super(key: key);

  @override
  _MenuBodyWidgetState createState() => _MenuBodyWidgetState();
}

class _MenuBodyWidgetState extends ModularState<MenuBodyWidget, MenuStore> {
  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<MenuStore, Failure, List<MenuEntity>>(
      store: store,
      onError: (_, error) => Text('$error'),
      onLoading: (_) => CircularProgressIndicator(),
      onState: (_, model) => Container(
        height: 600,
        child: ListView.builder(
            itemCount: model.length,
            itemBuilder: (_, index) {
              return MenuItemWidget(item: model[index]);
            }),
      ),
    );
  }
}
