
import 'package:car_rental_app/Domain/Entity/Car.dart';
import 'package:car_rental_app/Presentation/Pages/Maps_Details_page.dart';
import 'package:car_rental_app/Presentation/Widgets/car_card.dart';
import 'package:car_rental_app/Presentation/Widgets/more_cars.dart';
import 'package:flutter/material.dart';

class CarDetailsPage extends StatefulWidget {
  final Car car;

  const CarDetailsPage({super.key, required this.car});

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });

    _controller!.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller!.forward();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.info_outline),
            Text("Information"),
          ],
        ),
      ),
      body: Column(
        children: [
          CarCard(
              car: Car(
                  model: widget.car.model,
                  distance: widget.car.distance,
                  fuelCapacity: widget.car.fuelCapacity,
                  pricePerHour: widget.car.pricePerHour)),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: const Color(0xffF3F3F3),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              spreadRadius: 5),
                        ]),
                    child: const Column(
                      children: [
                        Icon(Icons.person_3_outlined),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Jane Cooper",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          "\$4,321",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                spreadRadius: 5),
                          ]),
                      child: ClipRRect
                      (
                        borderRadius: BorderRadius.circular(20),
                        child: Transform.scale(
                          scale: _animation!.value,
                          alignment: Alignment.center,
                          child: Image.asset("assets/maps.png", fit: BoxFit.cover,),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => MapsDetailsPage(car: widget.car)));
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                MoreCars(car: widget.car),
                const SizedBox(
                  height: 16,
                ),
                MoreCars(car: widget.car),
                const SizedBox(
                  height: 16,
                ),
                MoreCars(car: widget.car),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
