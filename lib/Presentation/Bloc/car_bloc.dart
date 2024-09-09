import 'package:bloc/bloc.dart';
import 'package:car_rental_app/Domain/Entity/Car.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../Domain/Usecase/fetch_cars_usecase.dart';

part 'car_event.dart';
part 'car_state.dart';

@Injectable()
class CarBloc extends Bloc<CarEvent, CarState>
{
  final FetchCarsUsecase fetchCars;

  CarBloc(super.initialState,  this.fetchCars)
  {
    on<CarEvent>((event, emit) async
    {
      try{
        final cars = await fetchCars.call();
        emit(CarLoaded(cars));
      }
      catch(e)
      {
        emit(CarError(e.toString()));
      }
    });
  }
}
