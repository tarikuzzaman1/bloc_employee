import 'package:bloc_employee/employee.dart';
import 'package:bloc_employee/employee_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final EmployeeBloc _employeeBloc = EmployeeBloc();

  @override
  void dispose() {
    _employeeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee App'),
      ),
      body: Container(
        child: StreamBuilder<List<Employee>>(
          stream: _employeeBloc.empListStream,
          builder:
              (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
            return ListView.builder(
              itemCount: snapshot.data != null ? snapshot.data.length : 0,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          '${snapshot.data[index].id}',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${snapshot.data[index].name}',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Text(
                              '৳ ${snapshot.data[index].salary}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(
                            Icons.thumb_up,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            _employeeBloc.empSalaryIncrement.add(snapshot.data[index]);
                          },
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(
                            Icons.thumb_down,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            _employeeBloc.empSalaryDecrement.add(snapshot.data[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
