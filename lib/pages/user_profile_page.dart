import 'package:flutter/material.dart';
import 'package:user_profile_page_flutter/app_data/app_data.dart';
import 'package:user_profile_page_flutter/models/profile.dart';
import './SecondScreen.dart';
//import 'package:getflutter/components/carousel/gf_items_carousel.dart';

class UserProfilePage extends StatefulWidget {
  UserProfilePage({Key key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  var selectedCard = "WEIGHT";
  Profile profile;
 

  get color => null;

  @override
  void initState() {
    profile = AppData.profiles[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7A9BEE),
      appBar: new AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: new Text("User"),
          leading: IconButton(
             icon: Icon(Icons.arrow_back), onPressed: () {},tooltip: "back",
          ),
         
        ),
        bottomNavigationBar: Theme(  // Create your custom style with Flutter Theme
          data: Theme.of(context).copyWith(
              canvasColor: Color(0xFF7A9BEE), // Choose your preferred color as the BottomNavigationBar background
              primaryColor: Colors.white.withOpacity(0.45), // Choose your preferred color as the primary color
              textTheme: Theme.of(context) // The text theme goes here
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.white))),
          child: BottomNavigationBar(
            
            currentIndex: 0, // Set initial state of BottomNavigationBar
            items: [          // Create your BottomNavigationBar items
              BottomNavigationBarItem(
                icon: new Icon(Icons.person),
                title: new Text("Profile"),
              ),
              BottomNavigationBarItem(
                  icon: new Icon(Icons.add), title: new Text("Upload")),
              BottomNavigationBarItem(
                  icon: new Icon(Icons.mail), title: new Text("Messaging"))
            ],
          ),
        ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width ,
                color: Colors.transparent,
              ),
              Positioned(
                top: 115.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.0) ,
                        topRight: Radius.circular(45.0) , 
                    ),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width ,
                ),

              ),
              Positioned(
                top: 35.0,
                left: (MediaQuery.of(context).size.width / 2)-60,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:AssetImage(AppData.profiles[0].imageUrl),
                      fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      boxShadow: [
                    BoxShadow(blurRadius: 7.0,color: Colors.black45)
                  ]
                  ),
                  height: 100.0,
                  width: 100.0,
                )
              ),
              Positioned(
                top: 150.0,
                left: 20,
                right: 14.0,
                child: Container(
                    child: Column(
                      children: <Widget>[
                        Text(AppData.profiles[0].title, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20)),
                        SizedBox(height: 10),
                Text(AppData.profiles[0].subtitle, style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16)),
                SizedBox(height: 10),
               Container(
                 child:Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: <Widget>[
                  
                     Column(
                       children: <Widget>[
                         Text(AppData.profiles[0].totalFollowing, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22.0, color: Colors.grey)),
                         Text("Followers"),
                         
                       ],
                     ),
                     
                     Column(
                       children: <Widget>[
                         Text(AppData.profiles[0].totalFollowers, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22.0, color: Colors.grey)),
                         Text("Followings")
                         
                       ],
                     )
                   ],
                 ),
                 
               ),
         
                      ],
                    )
                ),
              ),
              Positioned(
                top: 280.0,
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
                top: 290.0,
                left: 10.0,
                child: Column(
                  children: <Widget>[
                    Row(
                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Stories", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15.0, color: Colors.grey.withOpacity(0.9)))  
                      ],
                      
                    ),
                  ],
                )),
                SizedBox(width: 10.0),
                Container(
                  margin: EdgeInsets.only(top:318.0),
                       height: 240.0,
                       child: ListView(
                         scrollDirection: Axis.horizontal,
                         children: <Widget>[
                           
                           for (int i = 0; i < AppData.profiles.length; i++)
                           _buildInfoCard(AppData.profiles[i].title, AppData.profiles[i].totalFollowing,AppData.profiles[i].imageUrl), 
                         ],
                       ),
                     ),
                                     
    
            ],
          )
          ],
      ),
      
    );
  }
  Widget _buildInfoCard( String cardTitle, String info, String imageUrl ){
    return InkWell(
      onTap: (){
        selectCard(cardTitle);
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(),
        ));
      },
      
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all( color: cardTitle == selectedCard ? Colors.transparent : Colors.grey.withOpacity(0.1),
       
          ),
        ),
        margin: EdgeInsets.only(bottom:18.0, right: 5.0),
        
        height: 120.0,
        width: 145.0,
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  //margin: EdgeInsets.only(right:5.0),
                  height: 220.0,
                  width: 200.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image:AssetImage(imageUrl),
                      fit: BoxFit.cover
                      ),
                         borderRadius: BorderRadius.circular(10.0),
                        color: cardTitle == selectedCard ?  Color(0xFF7A9BEE) : Colors.white,
                      ),
                child:Column(
                  children: <Widget>[
                    Text(cardTitle, 
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0, 
                    color: cardTitle == selectedCard ? Color(0xFF7A9BEE) : Colors.white ),
                          ),
                          SizedBox(height: 170),
                    Text(info, 
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0, 
                    color: cardTitle == selectedCard ? Color(0xFF7A9BEE) : Colors.white ),
                    ),
                    
                    
                  ],
                ),
                
                )
              ],
            )
         

          ],
        ),
        
      )
    );
  }
  selectCard(cardTitle){
    setState(() {
     selectedCard = cardTitle; 
     Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SecondScreen()),
   );
    });
  }
}

