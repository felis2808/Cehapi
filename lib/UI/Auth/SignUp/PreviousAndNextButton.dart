import 'package:flutter/material.dart';

class PreviousAndNextButton extends StatefulWidget {
  final GlobalKey<FormState> globalKey;
  final bool showPrevious;
  final bool showNext;
  final String nextLabel;
  final void Function() onTapPrevious;
  final void Function() onTapNext;

  const PreviousAndNextButton({
    Key key,
    this.globalKey,
    this.showPrevious = true,
    this.showNext = true,
    this.nextLabel = 'Suivant',
    this.onTapPrevious,
    this.onTapNext,
  }) : super(key: key);

  @override
  _PreviousAndNextButtonState createState() => _PreviousAndNextButtonState();
}

class _PreviousAndNextButtonState extends State<PreviousAndNextButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.showPrevious
              ? InkWell(
                  onTap: widget.onTapPrevious,
                  child: Row(
                    children: [Icon(Icons.arrow_back_ios), Text("Précédent")],
                  ),
                )
              : Container(),
          widget.showNext
              ? InkWell(
                  onTap: widget.onTapNext,
                  child: Row(
                    children: [
                      Text(widget.nextLabel),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

// Ne pas oublier
// () {
//   setState(() {
//     FocusScope.of(context).requestFocus(new FocusNode());
//     // We don't keep passwords in the memory, user have enter again its password if he comes back to a previous page
//     password = '';
//     confirmPassword = '';
//     samePassword = true;
//     page--;
//     if (page < 0) {
//       page = 0;
//     }
//   });
// },
