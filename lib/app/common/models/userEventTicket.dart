import 'package:merchant_app/app/common/models/event.dart';

class UserEventTicket {
  final List<Event> event;
  final int ticketQuantity;
  String? walletAddress;

  UserEventTicket({required this.event, required this.ticketQuantity});
  factory UserEventTicket.fromJson(Map<String, dynamic> json) {
    final event = json["event"] as List<dynamic>;
    final events = event.map((event) => Event.fromMap(event)).toList();

    return UserEventTicket(
        event: events, ticketQuantity: int.parse(json["ticketQuantity"]));
  }
}
