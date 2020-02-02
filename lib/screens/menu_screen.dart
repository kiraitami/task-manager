import 'package:flutter/material.dart';
import 'package:flutter_app_task_manager/screens/create_task_screen.dart';


enum TAB_NAME {
  TASK,
  GROUP
}


class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  var _desiredTab = TAB_NAME.TASK;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Main Menu'),
            bottom: TabBar(
              isScrollable: true,
              tabs: choices.map((Choice choice) {
                return Tab(
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: choices.map((Choice choice){
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ChoiceCard(choice: choice),
              );
            }).toList(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              _loadScreen(_desiredTab);
            },
          ),
        ),
      ),
    );
  }



  _loadScreen(TAB_NAME tab){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context)=> tab == TAB_NAME.TASK ?  CreateTask() : null)
    );
  }


}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: '            Tasks             ', icon: Icons.check_circle),
  const Choice(title: '            Groups            ', icon: Icons.supervised_user_circle),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard( { Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}