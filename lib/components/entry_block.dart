import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import '../models/errors.dart';
import '../models/medicine_type.dart';

class EntryBlock {
  BehaviorSubject<MedicineType>? _chooseMedicineType$;
  ValueStream<MedicineType>? get chooseMedicineType => 
    _chooseMedicineType$!.stream;

  BehaviorSubject<int>? _chooseInterval$;
  BehaviorSubject<int>? get chooseInterval => _chooseInterval$;

  BehaviorSubject<String>? _selectedTimeOfDay$;
  BehaviorSubject<String>? get selectedTimeOfDay$ => _selectedTimeOfDay$;

  // error state

  BehaviorSubject<EntryError>? _errorState$;
  BehaviorSubject<EntryError>? get errorState$ => _errorState$;

  EntryBlock(){
    _chooseMedicineType$ = BehaviorSubject<MedicineType>.seeded(MedicineType.None);
    _selectedTimeOfDay$ = BehaviorSubject<String>.seeded('none');
    _chooseInterval$ = BehaviorSubject<int>.seeded(0);
    _errorState$ = BehaviorSubject<EntryError>();
  }

  @override
  void dispose() {
    _chooseMedicineType$!.close();
    _selectedTimeOfDay$!.close();
    _chooseInterval$!.close();
  } 
  void submitError(EntryError error) {
    _errorState$!.add(error);
  }

  void updateInterval(int interval) {
    _chooseInterval$!.add(interval);
  }

  void updateTime(String time) {
    _selectedTimeOfDay$!.add(time);
  }

  void updateSelectedMedicine(MedicineType type) {
    MedicineType _tempType = _chooseMedicineType$!.value;
    if (type == _tempType) {
      _chooseMedicineType$!.add(MedicineType.None);
    } else {
      _chooseMedicineType$!.add(type);
    }
  }
}