import 'package:flutter/material.dart';
import 'secondPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: 'list+Grid',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
            useMaterial3: true,
          ),
          home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var image = ['image/1.jpg','image/jasmine.jpeg','image/lav.jpeg',
    'image/lotus.jpeg', 'image/sunflower.jpeg','image/red-rose-jpg.jpg'];
  var name = ['cosmos', 'jasmine', 'lavender', ' lotus', 'sunflower', 'Rose'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
       length: 2,
      child: Scaffold(
          appBar: AppBar(
             title: Center(child: Text('ListView + GridView Task')),
              backgroundColor: Colors.orange[100],
              bottom: TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                dividerColor: Colors.deepOrange,
                  splashBorderRadius: BorderRadius.circular(20.0),
                  labelColor: Colors.pinkAccent[100],
                   unselectedLabelColor: Colors.black45,
                   tabs: [Text('List', style: TextStyle(fontSize: 25),),
                     Text('Grid',style: TextStyle(fontSize: 25),)],

          ),
        ),
        body:
          TabBarView(
            children:[
             ListView.builder(
              itemCount: image.length,

              itemBuilder: (BuildContext context, int index) {
                return InkWell(onTap: (){
                  showDialog(
                      context: context, builder: (BuildContext context ) {
                    return AlertDialog(
                      title: Text('Info'),
                      content:
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> secondPage(
                          names : name[index],
                          images: image[index],
                        )));
                      }, child: Text('Open')),
                    );
                  });
                },
                  child :Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(height: 20,),
                    Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(image[index]),
                          radius: 50,
                        ),
                        Text(name[index] , style: TextStyle(fontSize: 30),),
                      ]
                    ),Divider(thickness: 2,),
                  ],
                ),
                );
                },
            ),
             GridView.builder(
              itemCount: image.length ,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,),
              itemBuilder: (BuildContext context, int index){
                return InkWell(onTap: (){
                  showDialog(
                      context: context, builder: (BuildContext context ) {
                    return AlertDialog(
                      title: Text('Info'),
                      content:
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> secondPage(
                          names : name[index],
                          images: image[index],
                        )));
                      }, child: Text('Open')),
                    );
                  });
                },
                  child: Column(
                    children: [
                      SizedBox(height: 10, ),
                      CircleAvatar(
                      backgroundImage: AssetImage(image[index]),
                        radius: 50,),
                      Text(name[index]),
                    ],
                  ),
                );

              }),
            ],
          ),
    ),
    );
  }
}


