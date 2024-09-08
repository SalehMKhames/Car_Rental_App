import 'package:car_rental_app/Domain/Entity/Car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapsDetailsPage extends StatelessWidget
{
  final Car car;
  const MapsDetailsPage({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Stack(
        children:
        [
          const FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(51, -0.09),
              initialZoom: 13,
            ),
            children: [],
          ),
          Positioned
          (
            bottom: 0, left: 0, right: 0,
            child: carDetailsCard(car),
          ),
          Positioned(
            top: 55,
            right: 25,
            child: Image.asset("assets/charger-srt.png"),
          ),
      ]),
    );
  }
}


Widget carDetailsCard(Car car)
{
  return SizedBox(
    height: 350,
    child: Stack
    (
      children:
      [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)],
          ),
          child: Column
          (
            mainAxisAlignment: MainAxisAlignment.start,
            children:
            [
              const SizedBox(height: 20,),
              Text(car.model, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),),
              const SizedBox(width: 5,),
              Row(
                children:
                [
                  const Icon(Icons.directions_car, color: Colors.white, size: 16,),
                  const SizedBox(width: 5,),
                  Text("> ${car.distance} KM", style: const TextStyle(color: Colors.white, fontSize: 14),),
                  const SizedBox(width: 5,),
                  const Icon(Icons.battery_5_bar, color: Colors.white, size: 14,),
                  const SizedBox(width: 5,),
                  Text("${car.fuelCapacity}", style: const TextStyle(color: Colors.white, fontSize: 14),)
                ],
              ),
            ],
          ),
        ),
        Positioned
        (
          bottom: 0, left: 0, right: 0,
          child: Container
          (
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration
            (
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                const Text("Features", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                featuresIcons(),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$${car.pricePerHour}", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                    ElevatedButton
                    (
                      onPressed: (){},
                      child: const Text("Book Now", style: TextStyle(color: Colors.white),)
                    ),
                  ],
                ),
              ],
            ),
          )
        ),
      ],
    ),
  );
}

Widget featureIcon(IconData icon, String title, String subtitle)
{
  return Container(
    width: 100, height: 100,
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey, width: 1)),
    child: Column
    (
      children:
      [
        Icon(icon, size: 28,),
        Text(title),
        Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 10),),
      ],
    ),
  );
}

Widget featuresIcons()
{
  return Row
  (
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      featureIcon(Icons.local_gas_station, "Diesel", "Common Rail"),
      featureIcon(Icons.speed_sharp, "Acceleration", "0 - 100 KM\\H"),
      featureIcon(Icons.ac_unit, "Cold", "Temp Control"),
    ],
  );
}