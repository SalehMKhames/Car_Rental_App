import 'package:car_rental_app/Domain/Entity/Car.dart';

abstract class CarRepo
{
  const CarRepo();

  Future<List<Car>> fetchCars();
}