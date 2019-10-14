// TODO import
import 'dart:async';
import 'employee.dart';


class EmployeeBloc{

  // sink to add  in pipe
  // stream to get data from pipe
  // by pipe i mean data flow

// TODO List of employees
  List<Employee> _employeeList = [
    Employee(1, 'Employee One', 10000.0),
    Employee(2, 'Employee Two', 20000.0),
    Employee(3, 'Employee Three', 30000.0),
    Employee(4, 'Employee Four', 40000.0),
    Employee(5, 'Employee Five', 50000.0),
  ];

// TODO Stream controllers
final _empListStreamController = StreamController<List<Employee>>();
// for inc & dec
final _empSalaryIncrementStreamController = StreamController<Employee>();
final _empSalaryDecrementStreamController = StreamController<Employee>();

// TODO Stream Sink getter
Stream<List<Employee>> get empListStream => _empListStreamController.stream;
StreamSink<List<Employee>> get empListSink => _empListStreamController.sink;
StreamSink<Employee> get empSalaryIncrement => _empSalaryIncrementStreamController.sink;
StreamSink<Employee> get empSalaryDecrement => _empSalaryDecrementStreamController.sink;


// TODO Constructor - add data; listen to changes
  EmployeeBloc(){
    _empListStreamController.add(_employeeList);
    _empSalaryIncrementStreamController.stream.listen(_incrementSalary);
    _empSalaryDecrementStreamController.stream.listen(_decrementSalary);
  }

// TODO Core functions
  _incrementSalary(Employee employee){
    double salary = employee.salary;
    double incrementSalary = salary * 20/100;
    _employeeList[employee.id - 1].salary = salary + incrementSalary;
    empListSink.add(_employeeList);
  }
  _decrementSalary(Employee employee){
    double salary = employee.salary;
    double decrementedSalary = salary * 20/100;
    _employeeList[employee.id - 1].salary = salary - decrementedSalary;
    empListSink.add(_employeeList);
  }

  void dispose(){
    _empSalaryIncrementStreamController.close();
    _empSalaryDecrementStreamController.close();
    _empListStreamController.close();
  }
}