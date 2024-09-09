import 'package:car_rental_app/Domain/Entity/Car.dart';
import 'package:car_rental_app/Domain/Repo/Car_Repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class FetchCarsUsecase
{
  final CarRepo carRepo;
  FetchCarsUsecase(this.carRepo);

  Future<List<Car>> call() async => await carRepo.fetchCars();
}