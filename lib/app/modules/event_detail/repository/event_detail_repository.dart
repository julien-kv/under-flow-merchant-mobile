import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:merchant_app/app/common/models/event.dart';
import 'package:merchant_app/app/common/models/userEventTicket.dart';

import '../../../common/api/api_client.dart';
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
      var endpointUrl = 'http://192.168.1.218:1337/checkqr';
      Map<String, String> queryParams = {
        'contractAddress': contractAddress,
        'walletAddress': walletAddress
      };

      //String queryString = Uri.parse(queryParameters: queryParams).query;

      var requestUrl =
          '$endpointUrl?contractAddress=$contractAddress&walletAddress=$walletAddress';
      var response = await http.get(Uri.parse(requestUrl));
      // final response =
      //     await http.get(Uri.parse("http://192.168.1.218:1337/events"));

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
