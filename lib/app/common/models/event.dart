import 'dart:convert';

import 'package:merchant_app/app/common/util/utils.dart';

class Event {
  final int id;
  final String title;
  final String? imageUrl;
  final String? description;
  final String fiatPrice;
  final String datetime;
  final int capacity;
  final String merchantId;
  final String location;
  final String? contractAddress;
  Event({
    required this.id,
    required this.title,
    this.imageUrl,
    this.description,
    required this.fiatPrice,
    required this.datetime,
    required this.capacity,
    required this.merchantId,
    required this.location,
    this.contractAddress,
  });
  factory Event.emptyInitialization() {
    return Event(
        id: 2,
        title: Utils.getRandomString(4),
        fiatPrice: Utils.getRandomString(4),
        datetime: Utils.getRandomString(4),
        capacity: 2,
        merchantId: Utils.getRandomString(4),
        location: Utils.getRandomString(4));
  }

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
      datetime: datetime ?? this.datetime,
      capacity: capacity ?? this.capacity,
      merchantId: MerchantId ?? this.merchantId,
      location: location ?? this.location,
      contractAddress: contractAddress ?? this.contractAddress,
      id: id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'imageUrl': imageUrl,
      'description': description,
      'fiatPrice': fiatPrice,
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
        datetime: map['datetime'] as String,
        capacity: map['capacity'].toInt(),
        merchantId: map['merchantId'] as String,
        location: map['location'] as String,
        contractAddress:
            map['contractAddress'] == "" ? null : map['contractAddress'],
        id: map["id"]);
  }

  String toJson() => json.encode(toMap());
  factory Event.fromJson(String source) =>
      Event.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Events(title: $title, imageUrl: $imageUrl, description: $description, fiatPrice: $fiatPrice, datetime: $datetime, capacity: $capacity, MerchantId: $merchantId, location: $location, contractAddress: $contractAddress)';
  }

  @override
  bool operator ==(covariant Event other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.imageUrl == imageUrl &&
        other.description == description &&
        other.fiatPrice == fiatPrice &&
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
        datetime.hashCode ^
        capacity.hashCode ^
        merchantId.hashCode ^
        location.hashCode ^
        contractAddress.hashCode;
  }
}
