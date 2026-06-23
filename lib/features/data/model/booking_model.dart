class BookingModel {
  final String creatorName;
  final String packageName;
  final double amount;
  final String campaignName;
  final String requirements;
  final DateTime deliveryDate;

  BookingModel({
    required this.creatorName,
    required this.packageName,
    required this.amount,
    required this.campaignName,
    required this.requirements,
    required this.deliveryDate,
  });
}