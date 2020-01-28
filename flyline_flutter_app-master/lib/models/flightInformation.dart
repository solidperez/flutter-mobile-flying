
// A Pojo class for FlightInformation
import 'package:motel/utils/date_utils.dart';

class FlightInformationObject {
  String flyFrom;
  String flyTo;
  String cityFrom;
  String cityTo;
  int nightsInDest;
  List<FlightRouteObject> routes;
  DateTime localArrival;
  DateTime localDeparture;
  String durationDeparture;
  String durationReturn;

  FlightInformationObject(String flyFrom, String flyTo, String cityFrom, String cityTo, int nightsInDest, DateTime localArrival, DateTime localDeparture, List<FlightRouteObject> routes, String durationDeparture, String durationReturn) {
    this.flyFrom = flyFrom;
    this.flyTo = flyTo;
    this.cityFrom = cityFrom;
    this.cityTo = cityTo;
    this.routes = routes;
    this.localArrival = localArrival;
    this.localDeparture = localDeparture;
    this.nightsInDest = nightsInDest;
    this.durationDeparture = durationDeparture;
    this.durationReturn = durationReturn;
  }

  factory FlightInformationObject.fromJson(Map<String, dynamic> json) {
    
    var list = json['route'] as List;
    
    List<FlightRouteObject> items = List<FlightRouteObject>();
    
    items = list.map((i) => FlightRouteObject.fromJson(i)).toList();

    var durationDeparture="";
    var durationReturn="";

    var parsedDepartureDate = DateTime.parse(json["local_departure"]);
    var parsedArrivalDate = DateTime.parse(json["local_arrival"]);

    if (json["duration"]!=null && json["duration"]["departure"]!=null) durationDeparture =
  DateUtils.secs2hm(Duration(seconds:json["duration"]["departure"]).inSeconds);

    if (json["duration"]!=null && json["duration"]["return"]!=null) durationReturn =
  DateUtils.secs2hm(Duration(seconds:json["duration"]["return"]).inSeconds);
    
    return FlightInformationObject(json['flyFrom'], json["flyTo"], json['cityFrom'], json['cityTo'], json["nightsInDest"], parsedArrivalDate, parsedDepartureDate, items, durationDeparture, durationReturn);
    
  }

  @override
  String toString() {
    return 'FlightInformationObject{flyFrom: $flyFrom, flyTo: $flyTo, cityFrom: $cityFrom, cityTo: $cityTo, nightsInDest: $nightsInDest, routes: $routes, localArrival: $localArrival, localDeparture: $localDeparture, durationDeparture: $durationDeparture, durationReturn: $durationReturn}';
  }


}


  // A Pojo class for Flight Route
class FlightRouteObject {
  
  String cityFrom;
  String cityTo;
  String flyFrom;
  String flyTo;
  int flightNo;
  String airline;
  DateTime localArrival;
  DateTime localDeparture;

  FlightRouteObject(String flyFrom, String flyTo, String cityFrom, String cityTo, int flightNo, DateTime localArrival, DateTime localDeparture, String airline) {
    this.cityFrom = cityFrom;
    this.cityTo = cityTo;
    this.flyFrom = flyFrom;
    this.flyTo = flyTo;
    this.localArrival = localArrival;
    this.localDeparture = localDeparture;
    this.flightNo = flightNo;
    this.airline = airline;
  }

  factory FlightRouteObject.fromJson(Map<String, dynamic> json) {


    var parsedDepartureDate = DateTime.parse(json["local_departure"]);
    var parsedArrivalDate = DateTime.parse(json["local_arrival"]);
    
    return FlightRouteObject(json['flyFrom'], json["flyTo"], json['cityFrom'], json['cityTo'], json["flight_no"], parsedArrivalDate, parsedDepartureDate, json["airline"]);

  }

  @override
  String toString() {
    return 'FlightRouteObject{cityFrom: $cityFrom, cityTo: $cityTo, flyFrom: $flyFrom, flyTo: $flyTo, flightNo: $flightNo, airline: $airline, localArrival: $localArrival, localDeparture: $localDeparture}';
  }


}
