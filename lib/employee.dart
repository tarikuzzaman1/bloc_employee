class Employee {
  int _id;
  String _name;
  double _salary;

  Employee(this._id, this._name, this._salary);

  // setter
  set salary(double salary) {
    this._salary = salary;
  }

  set name(String name) {
    this._name = name;
  }

  set id(int id) {
    this._id = id;
  }

// gatter
  double get salary => this._salary;

  String get name => this._name;

  int get id => this._id;



}