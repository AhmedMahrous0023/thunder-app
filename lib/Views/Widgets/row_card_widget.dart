import 'package:flutter/material.dart';
import 'package:thunder_app/Views/Widgets/my_cutom_text.dart';

class RowCardWidget extends StatelessWidget {
  final String text;
  final Color color,textColor ;
  const RowCardWidget({super.key, required this.text,this.color=Colors.grey,  this.textColor=Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: MediaQuery.of(context).size.height*.04,
      width: MediaQuery.of(context).size.width*.11,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        color: color
        
        
      ),
      child: Center(child: MyCustomText(text: text,fontWeight: FontWeight.bold,color: textColor,)),
    );
  }
}