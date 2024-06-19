import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thunder_app/Models/company_model.dart';
import 'package:thunder_app/Views/Widgets/my_cutom_text.dart';
import 'package:thunder_app/Views/Widgets/row_card_widget.dart';

class CompanyDetailsScreen extends StatelessWidget {
  final CompanyModel companyModel;
  const CompanyDetailsScreen({super.key, required this.companyModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * .18,
                        height: MediaQuery.of(context).size.height * .10,
                        child: Card(
                          child: Image.asset(
                            companyModel.image,
                            fit: BoxFit.fill,
                          ),
                        )),
                    SizedBox(
                      width: 19,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyCustomText(
                          text: companyModel.shortName,
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*.10,
                          width: MediaQuery.of(context).size.width*.50,
                          child: MyCustomText(
                            text: companyModel.companyName,
                            
                            fontSize: 15,
                            maxlines: companyModel.companyName.split('').length>1?5:1,textoverFlow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 19),
                child: MyCustomText(
                  text: 'Last trade price',
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: MyCustomText(
                    text: 'EGP ${companyModel.price.toString()}',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
               Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    MyCustomText(
                        text: companyModel.increaseAverage!=0.0?'EGP ${companyModel.increaseEGP.toString()}(${companyModel.increaseAverage}%)':'EGP ${companyModel.decreaseEGP.toString()}(${companyModel.decreaseAverage})'
                        ,fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: companyModel.increaseAverage>0.0?Colors.green:Colors.red,),
                        Icon( companyModel.increaseAverage > 0.0?
                                      Icons.arrow_outward_rounded:Icons.arrow_downward_outlined,
                                      color: companyModel.increaseEGP > 0.0
                                          ? Colors.green
                                          : Colors.red,
                                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SvgPicture.asset('images/Line chart curved (1).svg',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .29,),
              ),
              const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: _buildDaysCards(),
            ),
            Divider(
              color: Colors.grey[300],thickness: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 20),
              child: MyCustomText(text: 'Statistics',fontWeight: FontWeight.bold,fontSize: 22,),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20,top: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.grey[600],
                                child: Icon(Icons.question_mark,size: 16,color: Colors.white,),),
                              MyCustomText(text: 'Price/Earnings',fontWeight: FontWeight.w800,fontSize: 17,)
                            ],
                          ),
                          MyCustomText(text: companyModel.earnings,fontSize: 18,fontWeight: FontWeight.w400,)
                        ],
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(left: 20,top: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.grey[600],
                                child: Icon(Icons.question_mark,size: 16,color: Colors.white,),),
                              MyCustomText(text: 'Market Cap',fontWeight: FontWeight.w800,fontSize: 17,)
                            ],
                          ),
                          MyCustomText(text: companyModel.marketCap,fontSize: 18,fontWeight: FontWeight.w400,)
                        ],
                      ),
                    ),
                    
          
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20,top: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.grey[600],
                                child: Icon(Icons.question_mark,size: 16,color: Colors.white,),),
                              MyCustomText(text: 'EPS',fontWeight: FontWeight.w800,fontSize: 17,)
                            ],
                          ),
                          MyCustomText(text: companyModel.eps.toString(),fontSize: 18,fontWeight: FontWeight.w400,)
                        ],
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(left: 20,top: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.grey[600],
                                child: Icon(Icons.question_mark,size: 16,color: Colors.white,),),
                              MyCustomText(text: 'Dividend Yield',fontWeight: FontWeight.w800,fontSize: 17,)
                            ],
                          ),
                          MyCustomText(text: companyModel.dividendYield,fontSize: 18,fontWeight: FontWeight.w400,)
                        ],
                      ),
                    ),
                    
          
                  ],
                ),
                 Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.grey[600],
                              child: Icon(Icons.question_mark,size: 16,color: Colors.white,),),
                            MyCustomText(text: 'Value Today',fontWeight: FontWeight.w800,fontSize: 17,)
                          ],
                        ),
                        MyCustomText(text: companyModel.valueToday,fontSize: 18,fontWeight: FontWeight.w400,)
                      ],
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(left: 20,top: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.grey[600],
                              child: Icon(Icons.question_mark,size: 16,color: Colors.white,),),
                            MyCustomText(text: 'Avg. Traded Value',fontWeight: FontWeight.w800,fontSize: 17,)
                          ],
                        ),
                        MyCustomText(text: companyModel.avgTradedValue,fontSize: 18,fontWeight: FontWeight.w400,)
                      ],
                    ),
                  ),
                  

                ],
              )
              ],
            ),
                        SizedBox(height: 20,),

            Divider(color: Colors.grey[300],thickness: 8,)
            ,SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: MyCustomText(text: 'About',fontWeight: FontWeight.bold,fontSize: 22,),
            ),
            Card(
              elevation: 0,
              child: Image.asset(companyModel.descriptionImage,)),
               SizedBox(height: 20,),

            Divider(color: Colors.grey[300],thickness: 8,),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 20),
              child: MyCustomText(text: 'You May Also Like',fontWeight: FontWeight.bold,fontSize: 22,),
            ),
            Row(
              children: [
                SizedBox(
                            height: MediaQuery.of(context).size.height*.10,
                            child: Card(
                              child: Image.asset('images/placeholder-image.png',fit: BoxFit.fill,),
                            ),
                          ),
                          MyCustomText(text: 'Coming Soon!',fontWeight: FontWeight.w600,color: Colors.grey,)
              ],
            )
            ],
          ),
        ),
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

