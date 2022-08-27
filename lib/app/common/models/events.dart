import 'dart:convert';

class Event {
  final String title;
  final String? imageUrl;
  final String? description;
  final String fiatPrice;
  final String cryptoPrice;
  final String datetime;
  final int capacity;
  final String merchantId;
  final String location;
  final String? contractAddress;
  Event({
    required this.title,
    this.imageUrl,
    this.description,
    required this.fiatPrice,
    required this.cryptoPrice,
    required this.datetime,
    required this.capacity,
    required this.merchantId,
    required this.location,
    this.contractAddress,
  });

  Event copyWith({
    String? title,
    String? imageUrl,
    String? description,
    String? fiatPrice,
    String? cryptoPrice,
    String? datetime,
    int? capacity,
    String? MerchantId,
    String? location,
    String? contractAddress,
  }) {
    return Event(
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      fiatPrice: fiatPrice ?? this.fiatPrice,
      cryptoPrice: cryptoPrice ?? this.cryptoPrice,
      datetime: datetime ?? this.datetime,
      capacity: capacity ?? this.capacity,
      merchantId: MerchantId ?? this.merchantId,
      location: location ?? this.location,
      contractAddress: contractAddress ?? this.contractAddress,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'imageUrl': imageUrl,
      'description': description,
      'fiatPrice': fiatPrice,
      'cryptoPrice': cryptoPrice,
      'datetime': datetime,
      'capacity': capacity,
      'MerchantId': merchantId,
      'location': location,
      'contractAddress': contractAddress,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      title: map['title'] as String,
      imageUrl: map['imageUrl'] == "" ? null : map['imageUrl'],
      description: map['description'] == "" ? null : map['description'],
      fiatPrice: map['fiatPrice'] as String,
      cryptoPrice: map['cryptoPrice'] as String,
      datetime: map['datetime'] as String,
      capacity: map['capacity'].toInt(),
      merchantId: map['MerchantId'] as String,
      location: map['location'] as String,
      contractAddress:
          map['contractAddress'] == "" ? null : map['contractAddress'],
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Events(title: $title, imageUrl: $imageUrl, description: $description, fiatPrice: $fiatPrice, cryptoPrice: $cryptoPrice, datetime: $datetime, capacity: $capacity, MerchantId: $merchantId, location: $location, contractAddress: $contractAddress)';
  }

  @override
  bool operator ==(covariant Event other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.imageUrl == imageUrl &&
        other.description == description &&
        other.fiatPrice == fiatPrice &&
        other.cryptoPrice == cryptoPrice &&
        other.datetime == datetime &&
        other.capacity == capacity &&
        other.merchantId == merchantId &&
        other.location == location &&
        other.contractAddress == contractAddress;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        imageUrl.hashCode ^
        description.hashCode ^
        fiatPrice.hashCode ^
        cryptoPrice.hashCode ^
        datetime.hashCode ^
        capacity.hashCode ^
        merchantId.hashCode ^
        location.hashCode ^
        contractAddress.hashCode;
  }
}
