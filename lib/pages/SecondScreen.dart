import 'package:flutter/material.dart';
import 'package:user_profile_page_flutter/app_data/app_data.dart';
import 'package:user_profile_page_flutter/models/profile.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({Key key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  Profile profile;

  @override
  void initState() {
    profile = AppData.profiles[0];
    super.initState();
  }

   @override
    Widget build(BuildContext context) {
      return Stack(
        children: <Widget>[
          Image.asset(
            AppData.profiles[0].imageUrl,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Scaffold(
              backgroundColor: Colors.transparent,
              appBar: new AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: new Text("User"),
          leading: IconButton(
             icon: Icon(Icons.arrow_back), onPressed: () {
               Navigator.pop(context);
             },tooltip: "back",
          ),
         
        ),
      
      body: Stack(
        children: <Widget>[
                  Positioned(
                top: 205.0,
                right: MediaQuery.of(context).size.width -175,
                child: Text(AppData.profiles[0].title, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25, color: Colors.white)),
              ),
                Positioned(
                top: 255.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0) ,
                        topRight: Radius.circular(25.0) , 
                    ),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width ,
                ),
              ),
              Positioned(
                top: 235.0,
                child: Container(
                  margin: EdgeInsets.only(left: 180),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    color: Color(0xFF7A9BEE),
                  ),
                  height: 45.0,
                  width: 140,

                ),
              ),    
              Positioned(
                top: 243.0,
                left: MediaQuery.of(context).size.width -145,
                child: Text("Follow",style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20, color: Colors.white54)),
              ),
              Positioned(
                left: 25.0,
                right: 35.0,
                top: 295.0,
                child: Text(AppData.profiles[1].subtitle, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: Colors.black38)),
              ),
                Positioned(
                top: 425.0,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(width:380, color: Colors.grey.withOpacity(0.3), height: 1.0),
                      ],
                      
                    )
                  ],
                 
                ),
              ),
             Positioned(
                top: 440.0,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(width:100,  
                        height: 150.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            _buildFollowers(AppData.profiles[2].imageUrl),
                            
                          ],
                        ),
                        ),
                      ],
                      
                    )
                  ],
                 
                ),
              ),
   
        ],
      )
      )
        ],
      );
    }

      Widget _buildFollowers( String imageUrl ){
    return InkWell(
      onTap: (){
     
      },
      
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all( color: Colors.grey.withOpacity(0.1),
          ),
        ),
        margin: EdgeInsets.only(right: 5.0),
        height: 120.0,
        width: 145.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
                Container(
                  //margin: EdgeInsets.only(right:5.0),
                  height: 100.0,
                  width: 100.0,
                 
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image:AssetImage(imageUrl),
                      fit: BoxFit.cover
                      ),
                         borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xFF7A9BEE) ,
                      ),
                
                )
              ],

        ),
        
      )
    );
  }
}