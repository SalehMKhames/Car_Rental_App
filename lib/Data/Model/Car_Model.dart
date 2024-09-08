import 'package:car_rental_app/Domain/Entity/Car.dart';

class CarModel extends Car
{
  CarModel({required super.model, required super.distance, required super.fuelCapacity, required super.pricePerHour});

  factory CarModel.fromMap(Map<String, dynamic> jsonMap)
  {
    return CarModel(model: jsonMap['Model'], distance: jsonMap['Distance'], fuelCapacity: jsonMap["Fuel"], pricePerHour: jsonMap['Price']);
  }

  Map<String, dynamic> toJson()
  {
    return
      {
        'Model' : model,
        'Distance' : distance,
        'Fuel' : fuelCapacity,
        'Price' : pricePerHour
      };
  }
}