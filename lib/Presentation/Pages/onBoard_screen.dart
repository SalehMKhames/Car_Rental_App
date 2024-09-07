import 'package:car_rental_app/Presentation/Pages/CarListScreen.dart';
import 'package:flutter/material.dart';

class OnboardScreen extends StatelessWidget
{
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      backgroundColor: const Color(0xff2C2B34),
      // appBar: AppBar(),
      body: Column
      (
        children:
        [
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration
              (
                image: DecorationImage(image: AssetImage("assets/onboarding.png"), fit: BoxFit.cover),
              ),
            ),
          ),
          Expanded(
            child: Column
            (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                const Text(
                  "Premium cars, \nEnjoy the luxury",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 10,),
                const Text("Premium and prestige car daily rental.\n Enjoy the thrill at lower price.", style: TextStyle(fontSize: 16),),
                const SizedBox(height: 20),
                SizedBox
                (
                  height: 54, width: 328,
                  child: ElevatedButton
                  (
                    style: ElevatedButton.styleFrom
                    (
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,

                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => CarListScreen()));
                    },
                    child: const Text("Let's Go", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

