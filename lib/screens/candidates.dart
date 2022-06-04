import 'package:election/shared/buttons.dart';
import 'package:election/shared/fonts_colors.dart';
import 'package:election/shared/helper_methods.dart';
import 'package:election/widgets/candidates_widget.dart';
import 'package:flutter/material.dart';



class CandidatesScreen extends StatefulWidget {
  const CandidatesScreen({ Key? key }) : super(key: key);

  @override
  State<CandidatesScreen> createState() => _CandidatesScreenState();
}

class _CandidatesScreenState extends State<CandidatesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/logo.png'),
              fit: BoxFit.fill
            )
          ),
        ),
        elevation: 0.0,
        backgroundColor: mainColor,
        title: Text('Candidates', style: whiteMainText),
      ),
      body: Container(
        decoration: backGroundImage(),
        child: Column(
          children: [
            SafeArea(
              top: true,
              child: decorationText(['Cairo', 'New Cairo', 'Tagmoaah', '15']),
            ),
            Flexible(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  CandidatesWidget(false),
                  CandidatesWidget(false),
                  CandidatesWidget(false),
                  CandidatesWidget(false),
                  CandidatesWidget(false),
                  Column(
                    children: [
                      CutsomButton(
                        'Approve',
                        Size(150, 75),
                        () {},
                        mainColor
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  decorationText(List<String> txt) {

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.white30,
        borderRadius: BorderRadius.circular(10.0)
      ),
      padding: EdgeInsets.fromLTRB(20.0, 5, 0.0, 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (String t in txt)
          Text('$t', style: whiteMainText),
        ],
      ),
    );
  }
}