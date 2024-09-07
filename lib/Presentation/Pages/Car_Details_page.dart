import 'package:car_rental_app/Data/Models/Car_model.dart';
import 'package:car_rental_app/Presentation/Widgets/car_card.dart';
import 'package:car_rental_app/Presentation/Widgets/more_cars.dart';
import 'package:flutter/material.dart';

class CarDetailsPage extends StatelessWidget
{
  final Car car;
  CarDetailsPage({super.key, required this.car});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar(
        title: const Row
        (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
          [
            Icon(Icons.info_outline),
            Text("Information"),
          ],
        ),
      ),
      body: Column
      (
        children:
        [
          CarCard(car: Car(model: "Dodge Demon", distance: 138, fuelCapacity: 70, pricePerHour: 550)),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row
            (
              children:
              [
                Expanded(
                  child: Container
                  (
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration
                    (
                      color: const Color(0xffF3F3F3),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 5),]
                    ),
                    child: const Column(
                      children:
                      [
                        Icon(Icons.person_3_outlined),
                        SizedBox(height: 10,),
                        Text("Jane Cooper", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("\$4,321", style: TextStyle(color: Colors.grey),),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child: Container
                  (
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage("assets/maps.png"),
                        fit: BoxFit.cover,
                      ),
                        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 5),]
                    ),

                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(18),
            child: Column
            (
              children:
              [
                MoreCars(car: car),
                const SizedBox(height: 16,),
                MoreCars(car: car),
                const SizedBox(height: 16,),
                MoreCars(car: car),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
