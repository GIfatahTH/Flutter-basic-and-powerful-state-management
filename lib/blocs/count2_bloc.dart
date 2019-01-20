import 'bloc_setting.dart';
import 'main_bloc.dart';

class Count2Bloc extends BloCSetting {
  var counter2State; // it will hold the refrence of the statefulWidget that we want to control its rebuild form this bloc
  int counter2 = 0;

  incrementCounter() {
    rebuildWidgets(
      setStates: () {
        counter2++;
      },
      states: [counter2State],
    );
    mainBloc?.counter2++;
  }
}

Count2Bloc count2Bloc;
