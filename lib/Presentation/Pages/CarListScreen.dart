import 'package:car_rental_app/Presentation/Bloc/car_bloc.dart';
import 'package:car_rental_app/Presentation/Widgets/car_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarListScreen extends StatelessWidget {
  CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Your Car"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state)
        {
          if (state is CarLoading)
            {
              return const CircularProgressIndicator(color: Colors.black87,);
            }
          else if (state is CarLoaded){
            return ListView.builder
              (
                itemCount: state.cars.length,
                itemBuilder: (context, index) {
                  return CarCard(car: state.cars[index]);
                }
            );
          }
          else if(state is CarError)
          {return Center(child: Text("error: ${state.message}"));}

          return Container();
        },
      ),
    );
  }
}
