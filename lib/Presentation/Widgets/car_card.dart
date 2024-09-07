import 'package:car_rental_app/Data/Models/Car_model.dart';
import 'package:car_rental_app/Presentation/Pages/Car_Details_page.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget
{
  final Car car;

  const CarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      child: Container
      (
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xffF3F3F3),
          borderRadius: BorderRadius.circular(20),
          boxShadow:
          const [
            BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 5),
          ]
        ),
        child: Column(
          children:
          [
            Image.asset("assets/GTR.png", height: 120,),
            Text(car.model, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            const SizedBox(height: 10,),
            Row(
              children:
              [
                Row(
                  children:
                  [
                    const Icon(Icons.gps_fixed_rounded),
                    Text("{$car.distance.toString} KM",),
                    Image.asset("assets/pump.png"),
                    Text("{$car.fuelCapacity.toString} Liter",)
                  ],
                ),
                Text("\$${car.pricePerHour.toString()}/hour", style: const TextStyle(fontSize: 16),),
              ],
            ),

          ],
        ),
      ),
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => CarDetailsPage(car: car,)));
      },
    );
  }
}
