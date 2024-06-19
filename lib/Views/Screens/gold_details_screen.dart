
import 'package:flutter/material.dart';
import 'package:thunder_app/Views/Widgets/gold_details_widget.dart';

class GoldDetailsScreen extends StatelessWidget {
  final String itemName,itemPrice,imageName,percentage,descibtionImage;
  const GoldDetailsScreen({super.key, required this.itemName, required this.itemPrice, required this.imageName, required this.percentage, required this.descibtionImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
            GoldDetailsWidget(imageName: imageName, firstText: 'EGGOLD', descibtionImage: descibtionImage, itemName: itemName, itemPrice: itemPrice, today: 'Today', percentage: percentage)
          ],
        ),
      )),
    );
  }
}