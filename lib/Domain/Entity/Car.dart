import 'package:equatable/equatable.dart';

class Car extends Equatable
{
  final String model;
  final double distance;
  final double fuelCapacity;
  final double pricePerHour;

  Car({required this.model, required this.distance, required this.fuelCapacity, required this.pricePerHour});

  @override
  List<Object?> get props => [model, distance, fuelCapacity, pricePerHour];
}