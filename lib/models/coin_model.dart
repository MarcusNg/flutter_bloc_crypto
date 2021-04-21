import 'package:equatable/equatable.dart';

class Coin extends Equatable {
  final String name;
  final String fullName;
  final double price;

  const Coin({
    required this.name,
    required this.fullName,
    required this.price,
  });

  @override
  List<Object?> get props => [name, fullName, price];

  factory Coin.fromMap(Map<String, dynamic> map) {
    return Coin(
      name: map['CoinInfo']?['Name'] ?? '',
      fullName: map['CoinInfo']?['FullName'] ?? '',
      price: (map['RAW']?['USD']?['PRICE'] ?? 0).toDouble(),
    );
  }
}
