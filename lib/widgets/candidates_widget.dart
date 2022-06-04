import 'package:election/screens/candidates_details.dart';
import 'package:election/shared/fonts_colors.dart';
import 'package:flutter/material.dart';



class CandidatesWidget extends StatefulWidget {

  final bool isDetails;

  const CandidatesWidget(this.isDetails, { Key? key }) : super(key: key);

  @override
  State<CandidatesWidget> createState() => _CandidatesWidgetState();
}

class _CandidatesWidgetState extends State<CandidatesWidget> {

  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {return CandidatesDetails();}));
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white54,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: 100.0,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage('https://avatars.githubusercontent.com/u/44323531?v=4'),
                      )
                    ),
                  ),
                  Container(
                    width: 100.0,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage('https://avatars.githubusercontent.com/u/44323531?v=4'),
                      )
                    ),
                  ),
              ],
            ),
            Container(
              width: 200.0,
              height: 75,
              child: ListTile(
                title: Text('Name', style: blackSubText,),
                trailing: widget.isDetails ? SizedBox() : Checkbox(
                  value: checked,
                  onChanged: (v) {
                    setState(() {
                      checked = v!;
                    });
                  },
                  activeColor: Colors.deepPurple,
                  checkColor: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}