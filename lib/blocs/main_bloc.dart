import './bloc_setting.dart';

class MainBloc extends BloCSetting {
  final String title = "setState() is powerful";
  int counter1 = 0;
  int counter2 = 0;
}

MainBloc mainBloc; // it is important to not instantiate it at this stage;
