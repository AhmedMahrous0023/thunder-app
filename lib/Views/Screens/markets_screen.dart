import 'package:flutter/material.dart';
import 'package:thunder_app/Models/market_model.dart';
import 'package:thunder_app/Views/Widgets/my_cutom_text.dart';
import 'package:thunder_app/Views/Widgets/my_tile_card.dart';

class MarketsScreen extends StatefulWidget {
  final List<MarketModel> visibleMarkets;
  const MarketsScreen({super.key, required this.visibleMarkets});

  @override
  State<MarketsScreen> createState() => _MarketsScreenState();
}

class _MarketsScreenState extends State<MarketsScreen> {
  late List<MarketModel> _visibleMarkets;

  @override
  void initState() {
    super.initState();
    _visibleMarkets = widget.visibleMarkets;
  }

  void toggleVisibility(int index) {
    setState(() {
      _visibleMarkets[index].isHide = !_visibleMarkets[index].isHide;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 30, top: 15),
            child: MyCustomText(
              text: 'Markets',
              fontSize: 31,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30, top: 8),
            child: MyCustomText(
              text: 'Add up to four different markets',
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: MyCustomText(
              text: 'to your daily feed',
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 25),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(_visibleMarkets.length, (index) {
              final market = _visibleMarkets[index];
              return Column(
                children: [
                  MyTileCard(
                    name: market.name!,
                    percentage: market.percentage!,
                    price: market.price!,
                    onPressed: () => toggleVisibility(index),
                    buttonName: market.isHide ? 'Show' : 'Hide',
                  ),
                  const SizedBox(height: 25),
                  if (!market.isHide)
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
