import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TutorialsDetail extends StatefulWidget {

  final DocumentSnapshot tutorial;

  TutorialsDetail({this.tutorial});

  @override
  _TutorialsDetailState createState() => _TutorialsDetailState();
}

class _TutorialsDetailState extends State<TutorialsDetail> {
  

  buildTutorialImage() {
    return Padding(
      padding: EdgeInsets.all(16),
        child: Container(
        height: 240,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.tutorial.data["mediaUrl"]),
            fit: BoxFit.cover,
            ),
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(8.0),
        ),
      )
    ); 
  }

  buildTutorialDescription() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Description",
            style: TextStyle(
              fontSize: 20.0, 
              fontWeight: FontWeight.bold, 
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(height: 8.0,),
          Text(widget.tutorial.data["description"],
            style: TextStyle(
              fontSize: 16.0,
            ),
            ),
        ],
      )
    );
  }

  buildStep1Image() {
    return Padding(
      padding: EdgeInsets.all(16),
        child: Container(
        height: 240,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.tutorial.data["step1media"]),
            fit: BoxFit.cover,
            ),
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(8.0),
        ),
      )
    ); 
  }

  buildStep1Instruction() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8), 
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Step 1", 
            style: TextStyle(
              fontSize: 20.0, 
                fontWeight: FontWeight.bold, 
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 8,),
          Text(widget.tutorial.data["step1text"], 
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      )
    );
  }

   buildStep2Image() {
    return Padding(
      padding: EdgeInsets.all(16),
        child: Container(
        height: 240,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.tutorial.data["step2media"]),
            fit: BoxFit.cover,
            ),
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(8.0),
        ),
      )
    ); 
  }

  buildStep2Instruction() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8), 
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Step 2", 
            style: TextStyle(
              fontSize: 20.0, 
                fontWeight: FontWeight.bold, 
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 8,),
          Text(widget.tutorial.data["step2text"], 
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      )
    );
  }

  buildStep3Image() {
    return Padding(
      padding: EdgeInsets.all(16),
        child: Container(
        height: 240,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.tutorial.data["step3media"]),
            fit: BoxFit.cover,
            ),
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(8.0),
        ),
      )
    ); 
  }

  buildStep3Instruction() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8), 
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Step 3", 
            style: TextStyle(
              fontSize: 20.0, 
                fontWeight: FontWeight.bold, 
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 8,),
          Text(widget.tutorial.data["step3text"], 
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      )
    );
  }
  
  buildStep4Image() {
    return Padding(
      padding: EdgeInsets.all(16),
        child: Container(
        height: 240,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.tutorial.data["step4media"]),
            fit: BoxFit.cover,
            ),
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(8.0),
        ),
      )
    ); 
  }

  buildStep4Instruction() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8), 
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Step 4", 
            style: TextStyle(
              fontSize: 20.0, 
                fontWeight: FontWeight.bold, 
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 8,),
          Text(widget.tutorial.data["step4text"], 
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      )
    );
  }
  
  buildStep5Image() {
    return Padding(
      padding: EdgeInsets.all(16),
        child: Container(
        height: 240,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.tutorial.data["step2media"]),
            fit: BoxFit.cover,
            ),
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(8.0),
        ),
      )
    ); 
  }

  buildStep5Instruction() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8), 
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Step 5", 
            style: TextStyle(
              fontSize: 20.0, 
                fontWeight: FontWeight.bold, 
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 8,),
          Text(widget.tutorial.data["step5text"], 
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      )
    );
  }
  
  buildStep6Image() {
    return Padding(
      padding: EdgeInsets.all(16),
        child: Container(
        height: 240,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.tutorial.data["step6media"]),
            fit: BoxFit.cover,
            ),
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(8.0),
        ),
      )
    ); 
  }

  buildStep6Instruction() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Step 6", 
            style: TextStyle(
              fontSize: 20.0, 
                fontWeight: FontWeight.bold, 
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 8,),
          Text(widget.tutorial.data["step6text"], 
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(widget.tutorial.data["title"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),),
      ),
      body: ListView(
        children: <Widget>[
          buildTutorialImage(),
          buildTutorialDescription(),
          buildStep1Instruction(),
          buildStep1Image(),
          buildStep2Instruction(),
          buildStep2Image(),
          buildStep3Instruction(),
          buildStep3Image(),
          buildStep4Instruction(),
          buildStep4Image(),
          buildStep5Instruction(),
          buildStep5Image(),
          buildStep6Instruction(),
          buildStep6Image(),
        ],
      ),
    );
  }
}