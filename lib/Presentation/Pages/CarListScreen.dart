import 'package:car_rental_app/Data/Models/Car_model.dart';
import 'package:car_rental_app/Presentation/Widgets/car_card.dart';
import 'package:flutter/material.dart';

class CarListScreen extends StatelessWidget
{
  CarListScreen({super.key});
  final List cars =
  [
    Car(model: "Lamborghini Aventador SV", distance: 138, fuelCapacity: 70, pricePerHour: 550),
    Car(model: "Dodge Demon", distance: 138, fuelCapacity: 70, pricePerHour: 550),
    Car(model: "Nissan GT-R", distance: 138, fuelCapacity: 70, pricePerHour: 550),
    Car(model: "Koenigsseg Jesko", distance: 138, fuelCapacity: 70, pricePerHour: 550),
    Car(model: "Dodge Charger SRT", distance: 138, fuelCapacity: 70, pricePerHour: 550),
  ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar:AppBar(
        title: const Text("Choose Your Car"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder
      (
        itemCount: cars.length,
        itemBuilder: (context, index)
        {
          return CarCard(car: cars[index]);
        }
      ),
    );
  }
}
