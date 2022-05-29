import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
   
  const CardSwiper({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height/2,
      color: Colors.red,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width *0.6,
        itemHeight: size.height *0.4,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap:() =>  Navigator.pushNamed(context, 'details'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                fit:  BoxFit.cover,
              placeholder:  AssetImage('assets/no-image.jpg'),
               image: NetworkImage('https://via.placeholder.com/300x400')),
            ),
          );
        }
        ),
    );
  } 
}