import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(task1());
}

class task1 extends StatelessWidget {
  const task1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,

      home: Scaffold(
        /*appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.blue,
              )),
            title: Text('Search..'),
          actions: [Icon(Icons.close,color: Colors.red,)],
        ),*/
        body: ListVertical(),
        bottomSheet: BottomAppBar(child: Icon(Icons.warning_outlined,color: Colors.red,),color: Colors.white,),
        
      ),
    );
  }
}

class ListVertical extends StatelessWidget {
  const ListVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          
          padding: const EdgeInsets.all(20.0),
          
                
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(width: 0.8),
                
              ),
              hintText: 'Search',
              prefixIcon: Icon(
                Icons.search,color: Colors.blue,
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 5,
                  width: 5,
                  
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: IconButton(onPressed: (){}, 
                    icon: Icon(Icons.clear,color: Colors.white,size: 15,)),
                  ),
                ),
              )
            ),
          ),
        ),
            
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
             
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                  
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 167, 180, 174),
                        offset: Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 8.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                  ),
                  child: ListTile(
                    title: Text(
                        'Headline in 2 lines,Headline in 2 lines,Headline in 2 lines,Headline in 2 lines,'),
                    subtitle: Text(
                        'Headline in 2 lines,Headline in 2 lines,Headline in 2 lines,'),
                    onTap: () {},
                  ),
                ),
              );
            }
          ),
        ),
      ],
    );
  }
}
/*abstract class ListItem{}

class HeadingItem extends ListItem{
  final String heading;
  HeadingItem(this.heading);
}

class MessageItem extends ListItem{
  final String sender;
  final String body;

  MessageItem(this.sender,this.body);
}

List<ListItem>getListItems(int length){
  return List<ListItem>.generate(length,(i){
    return i%6 == 0
    ?HeadingItem('Heading $i')
    :MessageItem('Sender $i','Meassage Body $i');
  });
}
class MixList extends StatelessWidget {
  final List<ListItem>items;
  MixList(this.items);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: items.length, itemBuilder: (context, index){
      final item=items[index];
      if(item is HeadingItem){
        return ListTile(
          title: Text(
            item.heading,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        );
      }
      else if(item is MessageItem){
        return ListTile(
          title: Text(item.sender),
          subtitle: Text(item.body),
        );
      }
    });
  }
}*/