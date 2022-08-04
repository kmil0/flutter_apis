import 'package:flutter/material.dart';

class CardMenu extends StatelessWidget {
  final String? titleApi;
  final String? imageName;
  final double? imageSize;
  final void Function()? onFunction;
  const CardMenu({
    Key? key,
    required this.shadowList,
    this.titleApi,
    this.imageName,
    this.imageSize,
    this.onFunction,
  }) : super(key: key);

  final List<BoxShadow> shadowList;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFunction,
      child: Container(
        height: 240,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Expanded(
                child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent.shade200,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: shadowList),
                  margin: const EdgeInsets.only(top: 50),
                ),
                Image.asset(
                  imageName!,
                  fit: BoxFit.cover,
                  height: imageSize,
                  alignment: Alignment.center,
                  // width: 900,
                )
              ],
            )),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 60, bottom: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: shadowList,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Center(
                  child: Text(
                    titleApi!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
