class CompanyModel {
  final String companyName,
      image,
      descriptionImage ,
      shortName,
      marketCap,
      earnings,
      dividendYield,
      avgTradedValue,
      valueToday;
  final double price, eps;
  final double increaseAverage, decreaseAverage,increaseEGP,decreaseEGP;
  CompanyModel(
      {required this.companyName,
      required this.shortName,
      required this.image,
      required this.descriptionImage,
      required this.marketCap,
      required this.earnings,
      required this.dividendYield,
      required this.avgTradedValue,
      this.decreaseAverage = 0.0,
      this.increaseAverage = 0.0,
      this.increaseEGP=0.0,
      this.decreaseEGP=0.0,
      required this.price,
      required this.eps,
      required this.valueToday});
}
