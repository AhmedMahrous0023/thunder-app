import 'package:flutter/material.dart';
import 'package:thunder_app/Views/Widgets/item_details_widget.dart';

class MarketItemDetails extends StatelessWidget {
  final String itemName,itemPrice,imageName,percentage;
  const MarketItemDetails({super.key, required this.itemName, required this.itemPrice, required this.imageName, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: ItemDetailsWidget(imageName: imageName, firstText:itemName , itemName: itemName, itemPrice: itemPrice,  today: 'Today',percentage: percentage,)),
    );
  }
}