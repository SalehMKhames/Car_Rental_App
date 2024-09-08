import 'package:car_rental_app/Domain/Entity/Car.dart';
import 'package:flutter/material.dart';

class MoreCars extends StatelessWidget
{
  final Car car;

  const MoreCars({super.key, required this.car});

  @override
  Widget build(BuildContext context)
  {
    return Container
    (
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration
      (
        color: const Color(0xff212020),
        borderRadius: BorderRadius.circular(18),
        boxShadow:const [BoxShadow(color: Colors.black54, blurRadius: 8, offset: Offset(0,4))]
      ),
      child: Row
      (
        children:
        [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Text(car.model, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
              const SizedBox(height: 7,),
              Row(
                children:
                [
                  const Icon(Icons.directions_car, color: Colors.white, size: 16,),
                  const SizedBox(width: 5,),
                  Text("> ${car.distance} KM", style: const TextStyle(color: Colors.white, fontSize: 14)),
                  const SizedBox(width: 5,),
                  const Icon(Icons.battery_5_bar, color: Colors.white, size: 16,),
                  const SizedBox(width: 5,),
                  Text(car.fuelCapacity.toString(), style: const TextStyle(color: Colors.white, fontSize: 14)),
                ],
              )
            ],
          ),
          const Icon(Icons.arrow_forward_ios_outlined, color: Colors.white, size: 24,),
        ],
      ),
    );
  }
}
