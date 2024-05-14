import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thunder_app/Views/Widgets/my_cutom_text.dart';
import 'package:thunder_app/Views/Widgets/row_card_widget.dart';

class BuyWidget extends StatelessWidget {
  final String imageName, firstText, itemName, itemPrice, today, percentage;
  const BuyWidget(
      {super.key,
      required this.imageName,
      required this.firstText,
      required this.itemName,
      required this.itemPrice,
      required this.today,
      required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Container(
                      height: 50,
                      width: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(12)),
                      child: Image.asset(
                        imageName,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyCustomText(text: firstText),
                      MyCustomText(text: itemName),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: MyCustomText(
                  text: itemPrice,
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Image.asset('images/Arrow_down.png'),
                  const SizedBox(
                    width: 4,
                  ),
                  MyCustomText(text: 'EGP 43.12 ($percentage)  '),
                  MyCustomText(text: today),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                    child: Expanded(
                        child: SvgPicture.asset(
                  'images/Line chart curved (1).svg',
                  width: 150,
                  height: 220,
                ))),
              ),
              const SizedBox(
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RowCardWidget(
                      text: '1D',
                      color: Colors.red,
                      textColor: Colors.white,
                    ),
                    RowCardWidget(
                      text: '1W',
                    ),
                    RowCardWidget(
                      text: '1M',
                    ),
                    RowCardWidget(
                      text: '6M',
                    ),
                    RowCardWidget(
                      text: '1Y',
                    ),
                    RowCardWidget(
                      text: '5Y',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Expanded(
                        child: Divider(
                      color: Colors.grey,
                    )),
                    SizedBox(
                      width: 25,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(310, 50),
                          backgroundColor: Colors.blue[100]),
                      onPressed: () {},
                      child: const MyCustomText(
                        text: 'Buy',
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
