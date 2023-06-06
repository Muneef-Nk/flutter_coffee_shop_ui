import 'package:flutter/material.dart';
String pickedSize = '';

class Home extends StatefulWidget {
   Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int count =1, min=1, max=10;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'StarBucks',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.workspace_premium_outlined,
                color: Colors.black,
              ))
        ],
      ),
      bottomNavigationBar: Container(
          height: 50,
          margin: EdgeInsets.all(10),
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green)),
              onPressed: () {},
              child: Text('Order Now'))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    bottom: -5,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: ClipOval(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.width / 2,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                  Center(
                      child: Image.asset(
                    'assets/cofee.png',
                    height: 260,
                  ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      'Caramel Frappuccino',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    '\$40',
                    style: TextStyle(fontSize: 25, color: Color(0xffaf8043)),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Size Options',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 3,),
                      Icon(Icons.coffee, color: Color(0xffaf8043),),
                      Text(pickedSize),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Color(0xffaf8043),
                    child: IconButton(
                      onPressed: _ShowDialog(context),
                      icon: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Text(
                  'Description',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Text(
                  'Coffee is a beverage prepared from roasted coffee beans. Darkly colored, bitter, and slightly acidic, coffee has a stimulating effect on humans, primarily due to its caffeine content. It has the highest sales in the world market for hot drinks.',
                  maxLines: 4,
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.grey),
                ),
              ),

                SizedBox(height: 10,),
              Row(
                children: [
                  Container(
                    width: 80,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xffaf8043),
                      borderRadius: BorderRadius.circular(40) ,
                    ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Icon(Icons.star, color: Colors.white,),
                          ),
                          Text('4.5', style: TextStyle(color: Colors.white, fontSize: 20),)
                        ],
                      ),
                  ),
                  Spacer(),
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    child: IconButton(onPressed: (){
                      setState(() {
                        if(count < max){
                          count++;
                        }
                      });
                    }, icon: Icon(Icons.add, color: Colors.white,))
                  ),
                  SizedBox(width: 5),
                  Text('$count', style: TextStyle(fontSize: 25, color: Colors.green),),
                  SizedBox(width: 5),
                  CircleAvatar(
                      backgroundColor: Colors.green,
                      child: IconButton(onPressed: (){
                        setState(() {
                         if(count > min){
                           count--;
                         }
                        });
                      }, icon: Icon(Icons.remove, color: Colors.white,))
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _SetSizeCup(String value) {
    setState(() {
      pickedSize = value;
      Navigator.pop(context);
    });
  }

  _ShowDialog(BuildContext context){
     var size = MediaQuery.of(context).size;
    return
      showDialog(
        context: context,
        builder: (_)  => SimpleDialog(
            title: Text('Pick Size'),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  _SetSizeCup('Small');
                },
                child: dialogItems('small', (size.width / 100) * 2.5, 15),
              ),
              SimpleDialogOption(
                onPressed: () {
                  _SetSizeCup('medium');
                },
                child: dialogItems('medium', (size.width / 100) * 3.5, 20),
              ),
              SimpleDialogOption(
                onPressed: () {
                  _SetSizeCup('large');
                },
                child: dialogItems('large', (size.width / 100) * 4.5, 25),
              ),
            ],
          )
      );
  }
  dialogItems(String title, double fontSize, double iconSize){
    return Row(
      children: [
        Icon(Icons.coffee, size: iconSize, color: Color(0xffaf8043),),
        Text(title, style: TextStyle(fontSize: fontSize),)
      ],
    );
  }

}
