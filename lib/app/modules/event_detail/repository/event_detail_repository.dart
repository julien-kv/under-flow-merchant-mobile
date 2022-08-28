import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:merchant_app/app/common/models/event.dart';
import 'package:merchant_app/app/common/models/userEventTicket.dart';

import '../../../common/api/api_client.dart';
import '../../../common/constants/config.dart';
import '../../../common/service/network_service.dart';
import '../../../common/values/strings.dart';

import 'package:http/http.dart' as http;

class EventDetailrepository {
  static final EventDetailrepository instance = EventDetailrepository._();
  EventDetailrepository._();
  factory EventDetailrepository() => instance;

  final ApiClient api = NetworkService.networkService.api;

  Future<Either<String, UserEventTicket>> getEventsAndTicket(
      String contractAddress, String walletAddress) async {
    UserEventTicket userEventTicket = UserEventTicket.empty();
    try {
      var endpointUrl = '${Config.baseUrl}/checkqr';
      var requestUrl =
          '$endpointUrl?contractAddress=$contractAddress&walletAddress=$walletAddress';
      var response = await http.get(Uri.parse(requestUrl));

      if (response.statusCode == 200) {
        final eventTicket = jsonDecode(response.body);
        userEventTicket = UserEventTicket.fromJson(eventTicket);
        print(userEventTicket);
      } else {
        throw Exception();
      }
    } catch (e) {
      return const Left(Strings.error);
    }

    return right(userEventTicket);
  }
}
