import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thunder_app/DataBase/Offline%20DB/companies_data.dart';
import 'package:thunder_app/Views/Screens/company_details_screen.dart';
import 'package:thunder_app/Views/Widgets/my_cutom_text.dart';
import 'package:thunder_app/Views/Widgets/row_card_widget.dart';

class ItemDetailsWidget extends StatelessWidget {
  final String imageName, firstText, itemName, itemPrice, today, percentage;
  const ItemDetailsWidget({
    super.key,
    required this.imageName,
    required this.firstText,
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
              MyCustomText(
                text: 'EGP 43.12 ($percentage)  ',
                fontWeight: FontWeight.bold,
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
          _buildStatistics(),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: MyCustomText(
              text: 'Constituentes',
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height *3,
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey[300],
                thickness: 3,
              ),
              itemCount: myCompanies.length,
              itemBuilder: (context, index) {
                final company = myCompanies[index];
                final List<String> words = company.companyName.split(' ');

                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyDetailsScreen(companyModel: company,)));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 7,
                          ),
                          Icon(
                            Icons.favorite_outline,
                            size: 30,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyCustomText(
                                text: company.price.toString(),
                                fontSize: 17,
                              ),
                              Row(
                                children: [
                                  MyCustomText(
                                    text: company.increaseAverage >= 0.0 &&
                                            company.decreaseAverage == 0.0
                                        ? '${company.increaseAverage}%'
                                        : '${company.decreaseAverage * -1}%',
                                    color: company.increaseAverage != 0.0
                                        ? Colors.green
                                        : Colors.red,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  Icon(
                                    company.increaseAverage > 0.0?
                                    Icons.arrow_outward_rounded:Icons.arrow_downward_outlined,
                                    color: company.increaseAverage > 0.0
                                        ? Colors.green
                                        : Colors.red,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              MyCustomText(
                                text: company.shortName,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                              MyCustomText(
                                  text: words.length > 2
                                      ? '${words[0]} ${words[1]} ... '
                                      : company.companyName,fontSize: 14,fontWeight: FontWeight.w400,)
                            ],
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .13,
                            height: MediaQuery.of(context).size.height * .07,
                            child: Card(
                              child: Image.asset(
                                company.image,fit: BoxFit.fill,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildStatistics() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(left: 20, top: 20),
        child: MyCustomText(
          text: 'Statisics',
          fontWeight: FontWeight.bold,
          fontSize: 21,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 12,
                        child: Icon(
                          Icons.question_mark_outlined,
                          color: Colors.white,
                          size: 16,
                        )),
                    MyCustomText(
                      text: 'Value Today',
                      fontWeight: FontWeight.w800,
                    ),
                  ],
                ),
                Row(
                  children: [
                    MyCustomText(
                      text: '2.09b',
                      color: Colors.grey,
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 12,
                        child: Icon(
                          Icons.question_mark_outlined,
                          size: 16,
                          color: Colors.white,
                        )),
                    MyCustomText(
                      text: 'Avg. Traded Values',
                      fontWeight: FontWeight.w800,
                    ),
                  ],
                ),
                Row(
                  children: [
                    MyCustomText(
                      text: '3.01b',
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                      fontSize: 19,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
      Divider(
        color: Colors.grey[300],
        thickness: 8,
      ),
    ],
  );
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
