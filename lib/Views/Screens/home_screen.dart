import 'package:flutter/material.dart';
import 'package:thunder_app/DataBase/Offline%20DB/markets_data.dart';
import 'package:thunder_app/Models/market_model.dart';
import 'package:thunder_app/Views/Screens/gold_details_screen.dart';
import 'package:thunder_app/Views/Screens/market_tem_details.dart';
import 'package:thunder_app/Views/Screens/markets_screen.dart';
import 'package:thunder_app/Views/Widgets/my_custom_card.dart';
import 'package:thunder_app/Views/Widgets/my_cutom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MarketModel> visibleMarkets =
      myMarkets.where((market) => !market.isHide).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            const MyCustomText(
              text: 'Markets',
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 190,
                ),
                itemCount: visibleMarkets.length,
                itemBuilder: (context, index) {
                  final market = visibleMarkets[index];
                  return Visibility(
                    visible: !market.isHide,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          if (market.name == 'EGX 30') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MarketItemDetails(
                                  itemName: market.name!,
                                  itemPrice: market.price!,
                                  imageName: market.image!,
                                  percentage: market.percentage!,
                                ),
                              ),
                            );
                          }  if(market.name=='24K Gold') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GoldDetailsScreen(
                                      itemName: market.name!,
                                      itemPrice: market.price!,
                                      imageName: market.image!,
                                      percentage: market.percentage!,
                                      descibtionImage: market.describtionImage!)),
                            );
                          }
                        },
                        child: MyCustomCard(
                          price: market.price!,
                          name: market.name!,
                          percentage: market.percentage!,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
