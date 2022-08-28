import 'package:merchant_app/app/common/models/event.dart';

class UserEventTicket {
  final Event event;
  final int ticketQuantity;
  String? walletAddress;

  UserEventTicket({required this.event, required this.ticketQuantity});
  factory UserEventTicket.fromJson(Map<String, dynamic> json) {
    final event = json["event"] as List<dynamic>;
    final events = Event.fromMap(event.first);

    return UserEventTicket(
        event: events, ticketQuantity: int.parse(json["ticketQuantity"]));
  }
  factory UserEventTicket.empty() =>
      UserEventTicket(event: Event.emptyInitialization(), ticketQuantity: 0);
}
