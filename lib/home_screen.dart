
import 'package:flutter/material.dart';
import 'package:starter_app/app_constant.dart';
import 'package:starter_app/calculator_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Dashboard"),),
      drawer:appDrawer(context) ,
      bottomNavigationBar: appBottomNavBar(),
    );
  }

  onTapItem(index)
  {
    print(index);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CalculatorScreen()));
   setState(() {
     selectedIndex=index;
   });
  }


appBottomNavBar()
{
  return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(
        label: "Home",
        icon: Icon(Icons.home),
        // backgroundColor: Colors.green,
      ),
      BottomNavigationBarItem(
        label: "Calculator",
        icon: Icon(Icons.person),
        // backgroundColor: Colors.green,
      ),
      BottomNavigationBarItem(
        label: "About",
        icon: Icon(Icons.info),
        // backgroundColor: Colors.green,
      ),
    ],
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.grey,
    currentIndex: selectedIndex,
    onTap: onTapItem,
  );
}

  appDrawer(context)
  {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.amber
            ),
            child: ListTile(

              leading: CircleAvatar(backgroundImage: NetworkImage(AppConstants.profile_img_url)),
              title: Text("JohnDev"),
              subtitle: Text("dev@gmail.com"),
            ),
          ),
          ListTile(title: Text("Home"),leading: Icon(Icons.home),onTap: (){
            // Then close the drawer
            Navigator.pop(context);
          },),

          ListTile(title: Text("Profile"),leading: Icon(Icons.person),onTap: (){
            // Then close the drawer
            Navigator.pop(context);
          },),
          Divider(),
          ListTile(title: Text("About us "),leading: Icon(Icons.info),onTap: (){
            // Then close the drawer
            Navigator.pop(context);
          },),
        ],
      ),
    );
  }
}

