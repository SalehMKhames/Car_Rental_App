import 'package:car_rental_app/Data/Model/Car_Model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCarSource
{
  final FirebaseFirestore fire;

  const FirebaseCarSource({required this.fire});

  Future<List<CarModel>> getCars() async
  {
    var snapshot = await fire.collection("cars").get();
    return snapshot.docs.map((doc) => CarModel.fromMap(doc.data())).toList();
  }
}