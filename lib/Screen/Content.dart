import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Content extends StatefulWidget {
  final String first;
  final String middle;
  final String last;
  final String images;
  final String gender;
  final String species;
  final String homeplanet;
  final String occupation;
  final String sayings;
  final String id;
  final String age;

  const Content(
      {Key? key,
      required this.id,
      required this.first,
      required this.gender,
      required this.images,
      required this.species,
      required this.homeplanet,
      required this.occupation,
      required this.sayings,
      required this.age, required this.middle, required this.last})
      : super(key: key);

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.withOpacity(0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.first}',
                  style: TextStyle(fontSize: 8, color: Colors.black54),
                ),
                Text(
                  '${widget.middle}',
                  style: TextStyle(fontSize: 8, color: Colors.black54),
                ),
                Text(
                  '${widget.last}',
                  style: TextStyle(fontSize: 8, color: Colors.black54),
                ),
                SizedBox(
                  height: 2,
                ),
                Text('${widget.gender}',
                  style: TextStyle(fontSize: 8, color: Colors.black54),
                ),
                Text('${widget.species}',
                  style: TextStyle(fontSize: 8, color: Colors.black54),
                ),
                Text('${widget.homeplanet}',
                  style: TextStyle(fontSize: 8, color: Colors.black54),
                ),
                Text('${widget.occupation}',
                  style: TextStyle(fontSize: 8, color: Colors.black54),
                ),
               // Flexible(
                 // flex: 2,
                  //child: Text(
                    //widget.sayings,
                    //style: TextStyle(fontSize: 2, color: Colors.black54),
                 // ),
               // ),
                Text('${widget.id}',
                  style: TextStyle(fontSize: 8, color: Colors.black54),
                ),
                Text('${widget.age}',
                  style: TextStyle(fontSize: 8, color: Colors.black54),
                ),
                Container(
                  height: 90,
                  width: 50,
                  padding: EdgeInsets.only(right: 10),
                  child: Image.network(
                    widget.images,
                    errorBuilder: (context, error, stackTrace) =>
                        SvgPicture.network(
                      widget.images, // for .svg extension
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
