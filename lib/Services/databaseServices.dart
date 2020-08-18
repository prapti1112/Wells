import 'package:firebase_database/firebase_database.dart';

class DatabaseServices {
  final  _databaseReference = FirebaseDatabase.instance.reference();

   Future<String> getMotorStatus() {
     _databaseReference.once().then((DataSnapshot snapshot) {
       print(snapshot.value['Well Data']['Float Sensor']['motor STATUS']); 
       if(snapshot.value['Well Data']['Float Sensor']['motor STATUS'] != null) { 
         return (snapshot.value['Well Data']['Float Sensor']['motor STATUS'] == 'ON') ? false : true;
       }
     });
   }

   updateMotorStatus(String status) {
     _databaseReference.child('Well Data').child('Float Sensor').update({'motor STATUS': status});
   }
}