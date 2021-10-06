import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/src/widgets/framework.dart';

void main() => runApp(const App());


class App extends StatelessWidget {
  const App({Key? Key}) :super(key: Key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StateWidget(),
    );
  }
}

class StateWidget extends StatefulWidget {
  const StateWidget({Key? key}) : super(key: key);


  @override
  State<StateWidget> createState() => _MyState();
}


class _MyState extends State<StateWidget> with SingleTickerProviderStateMixin {

  List<String> titles = ["Dashboard","Daily Rides","Statistics","Notifications"];
  bool switchButton = true;


  late TabController tabController;
  late String title;

  void initState(){
    title = titles[0];
    tabController = TabController(length: 4,vsync: this);
    tabController.addListener(changeTitle);
    super.initState();
  }

  void changeTitle(){
    setState(() {
      title = titles[tabController.index];
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0,horizontal: 0.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeeh9Gr91IPXev0RNMtgremjrghCUZMHjvzQ&usqp=CAU") ,
                  radius: 50.0,
                  backgroundColor: Colors.grey,
                ),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('test1234',style: TextStyle(fontSize: 25.0),strutStyle: StrutStyle(fontWeight: FontWeight.bold),),
                ),
                subtitle: Text('Profile completeness 61%\n view and edit profile',style: TextStyle(fontSize: 12.0),strutStyle: StrutStyle(fontWeight: FontWeight.normal),),
                onTap: (){},
              ),
            ),




            ListTile(
              leading: Icon(Icons.video_settings_sharp),
              title: Text('Show exported rides',style: TextStyle(fontSize: 20.0),textAlign: TextAlign.left,
              ),
              onTap: (){},
            ),

            ListTile(
              leading: Icon(Icons.local_gas_station_rounded
              ),
              title: Text('Fuel logs',style: TextStyle(fontSize: 20.0),textAlign: TextAlign.left,
              ),
              onTap: (){},
            ),

            ListTile(
              leading: Icon(Icons.share_sharp),
              title: Text('Location share',style: TextStyle(fontSize: 20.0),textAlign: TextAlign.left,
              ),
              onTap: (){},
            ),

            ListTile(
              leading: Icon(Icons.settings_sharp),
              title: Text('Settings',style: TextStyle(fontSize: 20.0),textAlign: TextAlign.left,
              ),
              onTap: (){},
            ),

            ListTile(
              leading: Icon(Icons.help_outline_sharp),
              title: Text('Help & Suggestion',style: TextStyle(fontSize: 20.0),textAlign: TextAlign.left,
              ),
              onTap: (){},
            ),

            ListTile(
              leading: Icon(Icons.library_add),
              title: Text('Add more vehicle',style: TextStyle(fontSize: 20.0),textAlign: TextAlign.left,
              ),
              onTap: (){},
            )

          ],
        ),
      ),


      appBar: AppBar(

        iconTheme: IconThemeData(color: Colors.black),
        leading: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Builder(
              builder: (context) =>
                  IconButton(
                    icon: Icon(LineIcons.bars,size: 30.0,),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
            )
        ),
          backgroundColor: Colors.grey.shade200,

          title: Text('Dashboard',style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 20.0),),
          actions: <Widget>[
          IconButton( icon: Icon(Icons.share_sharp), onPressed: () {  },)
        ],

      ),

    body: TabBarView(
      controller: tabController,
      children:<Widget>[

      ],
    ),


    bottomNavigationBar: Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.blue))
      ),

      child: TabBar(
        controller: tabController,
        labelColor: Colors.blue,
        unselectedLabelColor: Colors.grey.shade400,
        tabs: [
          // Tab(child: SvgPicture.asset("assets/images/guage.svg",color: Colors.blue,),),
          // Tab(icon: SvgPicture.asset("assets/images/direction.svg",),),
          Tab(icon: FaIcon(FontAwesomeIcons.tachometerAlt,size: 20.0,),),
          Tab(icon: FaIcon(FontAwesomeIcons.route,size: 20.0,),),
          Tab(icon: Icon(LineIcons.barChartAlt,size: 20.0,),),
          Tab(icon: Icon(Icons.notifications,size: 20.0,)),
          // Tab(icon: FaIcon(FontAwesomeIcons.bell),),
        ],
      ),

    ),


    );



  }
}



