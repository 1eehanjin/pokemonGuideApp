import 'package:flutter/material.dart';
import 'package:pokemon_guides_app/JsonDecoders/pokemon_model.dart';
import 'package:pokemon_guides_app/Theme/color.dart';
import 'package:pokemon_guides_app/Theme/sizes.dart';
class PokemonBaseStats extends StatefulWidget {
  final PokemonModel? pokemon;

  const PokemonBaseStats(this.pokemon,);

  @override
  _PokemonBaseStatsState createState() => _PokemonBaseStatsState();
}

class _PokemonBaseStatsState extends State<PokemonBaseStats> with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  PokemonModel? get pokemon => widget.pokemon;

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    final curvedAnimation = CurvedAnimation(
      curve: Curves.easeInOut,
      parent: _controller,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation);

    _controller.forward();
  }

  List<Widget> generateStatWidget() {
    return [
      Container(
        height: 6,
        child: Expanded(
          flex: 5,
          child:  ProgressBar(
            progress: 60,
            color:  Colors.lightBlue,
            enableAnimation: true,
          ),
        ),
      ),
      Stat(animation: _animation, label: 'Hp', value: pokemon!.hp, progress: 0,),
      SizedBox(height: MarginSizes.s),
      Stat(animation: _animation, label: 'Atttack', value: pokemon!.attack, progress: 10,),
      SizedBox(height: MarginSizes.s),
      Stat(animation: _animation, label: 'Defense', value: pokemon!.defense, progress: 20,),
      SizedBox(height: MarginSizes.s),
      Stat(animation: _animation, label: 'Sp. Atk', value: pokemon!.specialAttack, progress: 30,),
      SizedBox(height: MarginSizes.s),
      Stat(animation: _animation, label: 'Sp. Def', value: pokemon!.specialDefense, progress: 40,),
      SizedBox(height: MarginSizes.s),
      Stat(animation: _animation, label: 'Speed', value: pokemon!.speed, progress: 50,),
      SizedBox(height: MarginSizes.s),
      Stat(animation: _animation, label: 'Total', value: pokemon!.total, progress: 50,),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ...generateStatWidget(),
        ],
      ),
    );
  }
}



class Stat extends StatelessWidget {
  const Stat({
    required this.animation,
    required this.label,
    required this.value,
    required this.progress,
  });

  final Animation animation;
  final String label;
  final double progress;
  final num value;

  @override
  Widget build(BuildContext context) {
    final currentProgress =  value / 100;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text('$value'),
        ),
        Expanded(
          flex: 5,
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, widget) => ProgressBar(
              progress: animation.value * currentProgress,
              color: currentProgress < 0.5 ? Colors.lightBlue : AppColors.brandColor,
              enableAnimation: animation.value == 1,
            ),
          ),
        ),
      ],
    );
  }
}

class ProgressBar extends StatelessWidget {
  ProgressBar({
    this.color = AppColors.brandColor,
    this.backgroundColor = AppColors.backgroundColorLightGrey,
    required this.progress,
    required this.enableAnimation
  });

  final Color backgroundColor;
  final Color color;
  final double progress;
  bool enableAnimation;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: color,
      ),
    );

    return Container(
      clipBehavior: Clip.hardEdge,
      height: 6,
      alignment: Alignment.centerLeft,
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: AppColors.backgroundColorLightGrey,
      ),
      child: enableAnimation
          ? AnimatedAlign(
        duration: Duration(milliseconds: 260),
        alignment: Alignment(1, 0),
        widthFactor: progress,
        child: child,
      )
          : FractionallySizedBox(
        widthFactor: progress,
        child: child,
      ),
    );
  }
}