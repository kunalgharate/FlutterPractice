import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

 void main()
 {
    runApp( MaterialApp(
    home: MyApp()));
 }

 class MyApp extends StatefulWidget
 {
   @override
  _State createState() =>
    _State();
}
 class _State extends State<MyApp>
 {


   // Date picker

   String date= "";

   Future selectDate() async
   {
     DateTime? dateTime = await showDatePicker
       (context: context,
         initialDate: DateTime.now(),
         firstDate: DateTime(2020),
         lastDate: DateTime(2023));

     if(dateTime!=null) setState(()=> date = dateTime.toString());
   }

   String _value = 'India';
   String _flatButtonValue = 'Hiii';

   bool _value1 = false;
   bool _value2 = false;

   int radioValue1 = 0 ;
  late Object radioValue2  ;

   void _setRadioValue1(int value)=> setState(()=>radioValue1 = value);
   void _setRadioValue2(Object value)=> setState(()=>radioValue2 = value);

  /* Widget makeRadios()
   {
     List <Radio>list = [];
     for(int i = 0 ; i< 3; i++){
       list.add(Radio(value: i, groupValue: radioValue1, onChanged: (value) { _setRadioValue1(value);},));
     }
     Column column = Column(children:list);
     return column;

   }

   Widget makeRadiosTile()
   {
     List <Widget>list = [];
     for(int i = 0 ; i< 3; i++){
       list.add(RadioListTile(value: i, groupValue: radioValue1, onChanged:(value){_setRadioValue2(value!);}
       ,title: Text('Item ${i+1}'),
       tileColor: Colors.deepPurpleAccent,
       controlAffinity: ListTileControlAffinity.trailing,
       selected: true,));
     }
     Column column = Column(children:list);
     return column;

   }*/

   void _valuedChanged1(bool value) => setState(()
   {
    // _value1 = value;
   });
   void _valuedChanged2(bool value) => setState((){
     _value2 = value;
   });

   void onClick()
   {
     setState((){
       _value = "Name Changed to Delhi";
     });
   }

   void _onPressed()
   {
     setState((){
       _flatButtonValue = "Flat updated";
     });
   }

   void _onSubmit(String value)
   {
     setState((){
       _flatButtonValue = value;
     });
   }

   int appValue = 0 ;

   void add()
   {
     setState((){
       appValue++;
     });
   }

   void remove()
   {
     setState((){
       appValue--;
     });
   }
    @override
  Widget build(BuildContext context)
    {
      return Scaffold(
          appBar: AppBar(
            title: const Text("My APP"),
            backgroundColor: Colors.cyan,
            actions:  <Widget>[
              IconButton(onPressed: add, icon: const Icon(Icons.add)),
              IconButton(onPressed: remove, icon: const Icon(Icons.remove)),
            ]
          ),
        body: Container(padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
               Text(_value),
               Text(_flatButtonValue,style: TextStyle(fontWeight: FontWeight.w600)),
              ElevatedButton(onPressed: onClick, child: Text("Click me")),
              FlatButton(onPressed: _onPressed, child:  Text("Hello Flat")),
            /*  TextField(decoration: new InputDecoration(
                  label: Text(_value1.toString()),
                  hintText: 'Enter data',
                  icon: new Icon(Icons.people)
              ),
              autofocus: true,
              autocorrect: true,
              keyboardType: TextInputType.number,
              onSubmitted: _onSubmit,),*/
            /*  Checkbox(value: _value1, onChanged: (bool? value){
                setState((){
                  _value1 = value!;
                });
              }),
             CheckboxListTile(value: _value2, onChanged: (bool? value){
               setState(()
               {
                 _value2 = value!;
               });

             },
             title: Text("Male"),
             subtitle: Text("Select the option"),
             controlAffinity: ListTileControlAffinity.leading,
             secondary: new Icon(Icons.archive),
             activeColor: Colors.red,)
*/

         // makeRadios(),
           //   makeRadiosTile()

              Text(appValue.toString()),
           /*   ElevatedButton(onPressed: selectDate, child: const Text("Select date")),
              InkWell(
                onTap: printData,
                child:Image.network('https://picsum.photos/250?image=9',width: 100.0,height: 100.0,),
              ),
             Padding(padding: EdgeInsets.all(30),child:
               InkWell(
                 onTap: printData,
                 child:Image.network('https://picsum.photos/250?image=9',width: 100.0,height: 100.0,),
               ),)
*/


             // Expanded(child:Image.network('https://picsum.photos/250?image=9',width: 100.0,height: 100.0,))


               
            ],
          ),
        ),),
      );
    }

  void printData() {
     print("Image Clicked");
  }
}