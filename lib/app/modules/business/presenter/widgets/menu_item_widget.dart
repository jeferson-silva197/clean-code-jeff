import 'package:comercio_clean_architecture/app/modules/business/domain/entities/menu_entity.dart';
import 'package:flutter/material.dart';

class MenuItemWidget extends StatelessWidget {
  final MenuEntity item;

  const MenuItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            child: Image.network(item.image, fit: BoxFit.fill),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.description,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 10),
            ],
          ),
          Text('R\$ ${item.price}', style: TextStyle(fontSize: 14))
        ],
      ),
    );
  }
}
