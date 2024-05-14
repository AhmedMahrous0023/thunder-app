import 'package:flutter/material.dart';
import 'package:thunder_app/DataBase/Offline%20DB/markets_data.dart';
import 'package:thunder_app/Models/market_model.dart';
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
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: MyCustomText(
                    text: 'Markets',
                    fontSize: 31,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 150),
                  child: GestureDetector(
                    onTap: () async {
                      final updatedMarkets = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MarketsScreen(visibleMarkets: visibleMarkets)),
                      );
                      if (updatedMarkets != null) {
                        setState(() {
                          visibleMarkets = updatedMarkets;
                        });
                      }
                    },
                    child: const MyCustomText(
                      text: 'View all',
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
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
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
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
                      },
                      child: MyCustomCard(
                        price: market.price!,
                        name: market.name!,
                        percentage: market.percentage!,
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
