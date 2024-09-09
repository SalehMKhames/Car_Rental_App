import 'package:car_rental_app/Data/Data_Sources/Firebase_Car_Source.dart';
import 'package:car_rental_app/Domain/Entity/Car.dart';
import 'package:car_rental_app/Domain/Repo/Car_Repo.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: CarRepo)
class CarRepoImpl extends CarRepo
{
  final FirebaseCarSource firebaseCarSource;

  const CarRepoImpl({required this.firebaseCarSource});

  @override
  Future<List<Car>> fetchCars() async => await firebaseCarSource.getCars();

}