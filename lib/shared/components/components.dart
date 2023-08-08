import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:review/modules/todo_app/cubit/cubit.dart';

Widget default_button({

  double width= double.infinity,
  Color back_ground= Colors.blue,
   required Function function ,
  required String text,


}) =>Container(
width:width,
color: back_ground,
child: MaterialButton(
child: Text(text,style: TextStyle(
fontSize: 20,color: Colors.white),),
  onPressed: (){
    function();
  } ,


),
);



Widget default_Text_form({

 required TextEditingController controller,
  required  TextInputType textInputType,
  required String labelText,
  required IconData prefixIcon,
  IconButton? suffixIcon,
  bool ispassword =false,
  Function? ontap,
  Function? onchange,


}) =>TextFormField(
controller: controller ,
keyboardType: textInputType,

 
onFieldSubmitted: (String value){
print(value);
},
validator: (value){
if(!(value!.isEmpty)){
return null;
}
return("not valid");
} ,
decoration: InputDecoration(
border: OutlineInputBorder(),

labelText: labelText ,
prefixIcon: Icon( prefixIcon),
  suffixIcon:   suffixIcon,

) ,
  obscureText: ispassword,


);


Widget tasks_bulider({
  required Map map,
  required context

})=>Dismissible(
  key: Key(map["id"].toString()),
  onDismissed: (direction){
app_cubit.get(context).delete_from_database(id: map["id"]);
  },
  child:   Padding(
  
  padding: const EdgeInsets.all(15),
  
  child: Row(
  
  crossAxisAlignment: CrossAxisAlignment.start,
  
  children: [
  
  CircleAvatar(radius: 30,child:
  
  Padding(
  
    padding: const EdgeInsets.all(8.0),
  
    child:   Text("${map['time']}",
  
    style:TextStyle(fontSize:20,fontWeight: FontWeight.bold ),),
  
  ),),
  
  SizedBox(width: 10,),
  
  Expanded(
  
    child:   Column(
  
    crossAxisAlignment: CrossAxisAlignment.start,
  
    children: [
  
    Text("${map['title']}",
  
    style:TextStyle(fontSize:25,fontWeight: FontWeight.bold,color: Colors.black )),
  
    Text("${map['date']}",
  
    style:TextStyle(fontSize:20,fontWeight: FontWeight.bold ,color: Colors.grey[400]),),
  
    ],),
  
  ),
  
    SizedBox(width: 10,),
  
    IconButton(onPressed: (){
  
      app_cubit.get(context).update_database(id: map["id"], status: "done");
  
  
  
    }, icon: Icon(
  
        Icons.check_box,
  
      color: Colors.green,
  
    )),
  
    IconButton(onPressed: (){
  
      app_cubit.get(context).update_database(id: map["id"], status: "arch");
  
  
  
    }, icon: Icon(
  
      Icons.archive_rounded,
  
      color: Colors.black45,
  
    )),
  
  
  
  
  
  
  
  
  
  ],),
  
  ),
);


Widget app_tasks_bulider({
  required List<Map> tasks

})=>ConditionalBuilder(
  condition: tasks.length>0,
  builder: (context)=>ListView.separated(
      itemBuilder:(context,index) =>tasks_bulider(
          map: tasks[index],context: context
      ),
      separatorBuilder: (context,index)=>my_seperatorr(),
      itemCount: tasks.length),
  fallback: (context)=>Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.menu,
          color: Colors.grey,
          size: 50,),
        Center(
          child: Text("No tasks yet,"
              " please insert any tasks :)",
            style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight:FontWeight.w500
            ),),
        )
      ],
    ),
  ),

);




// Widget news_app_item_bulider({list,
//   required context,
//
// }){
//   bool noimg=false;
//   if(list["urlToImage"]==null){
//     noimg=true;
//   }
//
//   return InkWell(
//     onTap: (){
//       print(list["url"]);
//      // navigate_to(context, web_view(list["url"]));
//     },
//     child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     height: 120,
//                     width: 120,
//                     decoration: BoxDecoration(
//                       borderRadius:BorderRadius.circular(15) ,
//                       image:DecorationImage(
//                         image: NetworkImage(noimg?"https://image.shutterstock.com/image-vector/no-image-available-vector-hand-260nw-745639717.jpg":'${list["urlToImage"]}'),
//                         fit: BoxFit.cover,
//
//
//                       ) ,
//                     ),
//                   ),
//                   SizedBox(width: 10,),
//                   Expanded(
//                     child: Container(
//                       height: 120,
//
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//
//                           Text('${list["title"]}',
//                             style: Theme.of(context).textTheme.bodyText1,
//                             maxLines: 3,
//                             overflow:TextOverflow.ellipsis ,
//
//                           ),
//
//                           SizedBox(height: 5,),
//                           Text('${list["publishedAt"]}',
//                             style: TextStyle(
//                                 color:Colors.grey,
//                                 fontSize: 15
//                             ),
//                             maxLines: 1,
//                             overflow:TextOverflow.ellipsis ,
//
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//
//
//
//                 ],
//               ),
//             ],
//           ),
//         ),
//   );}

// Widget news_app_bulider({list,issearch=false
//
// })=>ConditionalBuilder(
//   condition: list.length>0,
//   builder:(contex)=> ListView.separated(
//       itemBuilder: (contex,index)=>news_app_item_bulider(list: list[index],context: contex) ,
//       separatorBuilder: (context,index)=>my_seperatorr(),
//       itemCount: list.length) ,
//   fallback: (contex)=>issearch?Container():Center(child: CircularProgressIndicator(color: Colors.deepOrange,)),
//
// );




Widget my_seperatorr()=>Container(
width: double.infinity,
height: 1,
color: Colors.grey[200],
);


void navigate_to(context,widget){
   Navigator.push(
      context, MaterialPageRoute(builder: (context)=>widget)

  );
}