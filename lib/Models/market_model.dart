class MarketModel {
  final String? name;
  final String? price;
  final String? percentage;
  final String? image;
  final String?describtionImage ;
  bool isHide;

  MarketModel(
      {this.isHide = false,
      required this.name,
      required this.price,
      required this.percentage,
      required this .describtionImage ,
      this.image = 'images/placeholder-image.png'});

       void toggleHidden() {
    isHide = !isHide;
  }
}
