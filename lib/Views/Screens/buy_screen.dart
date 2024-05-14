import 'package:flutter/material.dart';
import 'package:thunder_app/Views/Widgets/buy_widget.dart';

class BuyScreen extends StatelessWidget {
    final String imageName, firstText, itemName, itemPrice, today, percentage;

  const BuyScreen({super.key, required this.imageName, required this.firstText, required this.itemName, required this.itemPrice, required this.today, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: BuyWidget(imageName: imageName, firstText: firstText, itemName: itemName, itemPrice: itemPrice, today: today, percentage: percentage),
    );
  }
}