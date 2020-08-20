import 'package:flutter/material.dart';
import 'package:heritage/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:heritage/widgets/drawer.dart';
//import 'package:heritage/widgets/header.dart';

  class ListItem{
  String todoText;
  bool todoCheck;
  ListItem(this.todoText, this.todoCheck); 
}

class _StrikeThrough extends StatelessWidget{

  final String todoText;
  final bool todoCheck;
  _StrikeThrough(this.todoText, this.todoCheck) : super();

  Widget _widget(){
    if(todoCheck){
      return Text(
        todoText,
        style: TextStyle(
          decoration: TextDecoration.lineThrough,
          fontStyle: FontStyle.italic,
          fontSize: 22.0,
          color: Colors.red[200],
        ),
      );
    }
    else{
      return Text(
        todoText,
        style: TextStyle(
          fontSize: 22.0
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context){
    return _widget();
  }
}

class SkillsTrack extends StatefulWidget{
  static const routeName = '/skillsTrack';

  @override
  SkillsTrackState createState(){
    return SkillsTrackState();
  }
}

class SkillsTrackState extends State<SkillsTrack>{

  var counter = 0;

  var textController = TextEditingController();
  var popUpTextController = TextEditingController();

  List<ListItem> widgetList = [];

  @override
  void dispose(){
    textController.dispose();
    popUpTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
      leading: new IconButton(
    icon: new Icon(Icons.arrow_back_ios),
    onPressed: () {
      Navigator.of(context).pushNamed(MyApp.routeName);
    },
      ),
      title: Text("Skills Track",
      style: TextStyle(
        color: Colors.white,
        fontSize: 22.0,
      ),
      overflow: TextOverflow.ellipsis,
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).primaryColor,
  ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Create a new task"
              ),
              style: TextStyle(
                fontSize: 20.0,
                //color: Theme.of(context).accentColor,
              ),
              controller: textController,
              cursorWidth: 3.0,
              autocorrect: true,
              autofocus: true,
              //onSubmitted: ,
            ),
          ),
          SizedBox(height: 8,),
          RaisedButton(
            child: Text("Add Todo"),
            onPressed: (){
              if(textController.text.isNotEmpty){
                widgetList.add(new ListItem(textController.text, false));
                setState(() {
                  textController.clear();
                });
              }
            },
          ),
          Expanded(
            child: ReorderableListView(
              children: <Widget>[
                for(final widget in widgetList)        
                  GestureDetector(
                  key: Key(widget.todoText),
                  child: Dismissible(
                    key: Key(widget.todoText),
                    child: CheckboxListTile(
                      //key: ValueKey("Checkboxtile $widget"),
                      value: widget.todoCheck,
                      title: _StrikeThrough(widget.todoText, widget.todoCheck),
                      onChanged: (checkValue){
                        //_strikethrough toggle
                        setState(() {
                          if(!checkValue){
                            widget.todoCheck = false;
                          }
                          else{
                            widget.todoCheck = true;
                          }
                        });
                      },
                    ),
                    background: Container(
                      child: Icon(Icons.delete),
                      alignment: Alignment.centerRight,
                      color: Colors.orange[300],
                      ),
                    confirmDismiss: (dismissDirection){
                      return showDialog(//On Dismissing
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context){
                          return AlertDialog(
                            title: Text("Delete Todo?"),
                            actions: <Widget>[
                              FlatButton(
                                child: Text("OK"),
                                onPressed: (){
                                  Navigator.of(context).pop(true);
                                },
                              ),//OK Button
                              FlatButton(
                                child: Text("Cancel"),
                                onPressed: (){
                                  Navigator.of(context).pop(false);
                                },
                              ),//Cancel Button
                            ],
                          );
                        }
                      );
                    },
                    direction: DismissDirection.endToStart,
                    movementDuration: const Duration(milliseconds: 200),
                    onDismissed: (dismissDirection){//Delete Todo
                        widgetList.remove(widget);
                      Fluttertoast.showToast(
                        msg: "Todo Deleted!"
                      );
                    },
                    ),
            onDoubleTap: (){
              popUpTextController.text = widget.todoText;
              //For Editing Todo
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context){
                  return AlertDialog(
                    title: Text("Edit Todo"),
                    content: TextFormField(
                      controller: popUpTextController,
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("OK"),
                        onPressed: (){
                          setState(() {
                            widget.todoText = popUpTextController.text;
                          });
                          Navigator.of(context).pop(true);
                        },
                      ),//OK Button
                      FlatButton(
                        child: Text("Cancel"),
                        onPressed: (){
                          Navigator.of(context).pop(false);
                        },
                      ),//Cancel Button
                    ],
                  );
                }
              );
            },
          )
      ],
      onReorder: (oldIndex, newIndex){
        setState(() {
          if(oldIndex < newIndex){
            newIndex -= 1;
            }
          var replaceWiget = widgetList.removeAt(oldIndex);
          widgetList.insert(newIndex, replaceWiget);
          });
      },
    ),
  )
],
),
));
}
}