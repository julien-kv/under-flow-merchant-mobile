import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:merchant_app/app/common/constants/config.dart';

import '../../../common/api/api_client.dart';
import '../../../common/models/event.dart';
import '../../../common/service/network_service.dart';
import '../../../common/values/strings.dart';
import 'package:http/http.dart' as http;

class AllEventsRepository {
  static final AllEventsRepository instance = AllEventsRepository._();
  AllEventsRepository._();
  factory AllEventsRepository() => instance;

  final ApiClient api = NetworkService.networkService.api;
  Future<Either<String, List<Event>>> getEvents() async {
    List<Event> eventList = <Event>[];
    try {
      final url = "${Config.baseUrl}/events";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final events = jsonDecode(response.body) as List<dynamic>;
        eventList = events.map((event) {
          return Event.fromMap(event);
        }).toList();
      } else {
        throw Exception();
      }
    } catch (e) {
      return const Left(Strings.error);
    }

    return right(eventList);
  }
}
