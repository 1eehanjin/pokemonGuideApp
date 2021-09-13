import 'package:flutter/material.dart';
import 'package:pokemon_guides_app/Theme/sizes.dart';

class TrainerCard extends StatelessWidget {
  const TrainerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom:20, left: marginSizeSide, right: marginSizeSide),
        decoration: BoxDecoration(
            color: Colors.red[400],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: Offset(0, 10), // changes position of shadow
            ),
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ]
        ),
        child: AspectRatio
          (
            aspectRatio: 1.6,
            child: Stack(
              children: [
                Positioned(
                    top: 20,left: 20,
                    child: Text("Trainer Card",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white38, fontSize: fontSize36),)
                ),

                Positioned(
                    top: 60,left: 30,
                    child: Text("Name",
                      style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white60, fontSize: fontSize28),)
                ),
                Positioned(
                    top: 80,left: 30,
                    child: Text("Hanjin LEE",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: fontSize40),)
                ),

                Positioned(
                    top: 120,left: 30,
                    child: Text("Friend Code",
                      style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white60, fontSize: fontSize28),)
                ),
                Positioned(
                    top: 140,left: 30,
                    child: Text("1234-5678-9101-1121",
                      style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white, fontSize: fontSize28),)
                ),

                Positioned(
                  right: 16,top: -32,
                  child: Container(
                    height: 200,width: 200,
                    child:Image.asset("assets/images/pokeball.png",color: Colors.white,),

                  ),
                ),

                Positioned(
                  right: 30,top: 30,
                  child: Container(
                      height: 150,width: 150,
                      child:Image.asset("assets/images/pika.png")
                  ),
                ),

                Positioned(
                    bottom: 20,left: 80,
                    child: Text("Pokemon Collected: 254 / 524 ",
                      style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white70, fontSize: fontSize28),)
                ),

              ],
            )

        )

    );
  }
}
