import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
void main()
{
  runApp(MaterialApp(home:app1()));
}
class app1 extends StatefulWidget {
  const app1({Key? key}) : super(key: key);

  @override
  State<app1> createState() => _app1State();
}

class _app1State extends State<app1> {
  late int d,m,y;
  String days1="",month1="",year1="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Age Calcuator"),),
    body: Center(
      child: Column(children: <Widget>[
        RaisedButton(child: Text("Choose Date"),onPressed: (){f1();},),
        Text(year1+" "+month1+" "+days1,style: TextStyle(fontSize: 28),)


      ],),
    )

    );
  }
  Future f1() async
  {
    DateTime? date1=await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2050));
    setState(() {
      d=int.parse(DateFormat("dd").format(date1!));
      m=int.parse(DateFormat("MM").format(date1));
      y=int.parse(DateFormat("yy").format(date1));
      int d1=d=int.parse(DateFormat("dd").format(DateTime.now()));
      int m1=d=int.parse(DateFormat("MM").format(DateTime.now()));
      int y1=d=int.parse(DateFormat("yy").format(DateTime.now()));
      int day=finddays(m1,y1);
      if(d1-d>=0) {
        days1=(d1-d).toString()+" days";
      } else {
        days1 = (d1+day-d).toString() + " days";
        m1=m1-1;
      }
      if(m1-m>0) {
        month1=(m1-m).toString()+" months";
      } else
        {
          month1=(m1+12-m).toString()+" months";
          y1=y1-1;
        }
        year1=(y1-y).toString()+" years";



    });


  }
  int finddays(int m2,int y2)
  {

    int day2;
    if(m2==1 || m2==3 || m2==5 || m2==7 || m2==8 || m2==10 || m2==12)
      day2=31;
    else if(m2==4 || m2==6 || m2==9 || m2==11)
      day2=30;
    else
      {
        if(y2%4==0)
          day2=29;
        else
          day2=28;
      }
    return day2;

  }


}
