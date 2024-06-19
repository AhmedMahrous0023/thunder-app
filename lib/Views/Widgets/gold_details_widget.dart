
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thunder_app/Views/Widgets/my_cutom_text.dart';
import 'package:thunder_app/Views/Widgets/row_card_widget.dart';

class GoldDetailsWidget extends StatelessWidget {
  final String imageName, firstText, itemName, itemPrice, today, percentage,descibtionImage;
  const GoldDetailsWidget({
    super.key,
    required this.imageName,
    required this.firstText,
    required this.descibtionImage,
    required this.itemName,
    required this.itemPrice,
    required this.today,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  MyCustomText(
                    text: firstText,
                    color: Colors.grey,
                    fontSize: 19,
                  ),
                  MyCustomText(
                    text: itemName,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              children: [
                MyCustomText(text: '/ gm  ',fontSize: 15,fontWeight: FontWeight.w400,),
                MyCustomText(
                  text: itemPrice,
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                ),
              ],
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
              MyCustomText(
                text: 'EGP 43.12 ($percentage)  ',
                fontWeight: FontWeight.bold,color: Colors.red,
              ),
              MyCustomText(
                text: today,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
                child: SvgPicture.asset(
                          'images/Line chart curved (1).svg',
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * .29,
                        )),
          ),
          const SizedBox(
            height: 25,
          ),
          _buildDaysCards(),
          const SizedBox(
            height: 45,
          ),
          Divider(
            color: Colors.grey[300],
            thickness: 8,
          ),
           Padding(
              padding: const EdgeInsets.only(left: 20),
              child: MyCustomText(text: 'About',fontWeight: FontWeight.bold,fontSize: 22,),
            ),
            Card(
              elevation: 0,
              child: Image.asset(descibtionImage,)),
               SizedBox(height: 20,),
               Divider(
            color: Colors.grey[300],
            thickness: 8,
          ),
           SizedBox(height: 20,),
          
        ],
      ),
    );
  }
}



Widget _buildDaysCards() {
  return Padding(
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
  );
}
