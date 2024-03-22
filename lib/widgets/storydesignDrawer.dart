import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class StoryDesignOptions extends StatelessWidget {
  const StoryDesignOptions({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double reducedHeight = screenHeight - (screenHeight * 0.4);
    return SafeArea(
        child: Container(
      color: const Color.fromARGB(255, 55, 55, 55).withOpacity(0.955),
      height: reducedHeight,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'Search',
                  filled: true,
                  fillColor: Colors.white10,
                  hintStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
            ),
          ),
          Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2.5,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    Widget sticker = Container();
                    switch (index) {
                      case 0:
                        sticker = _buildSticker("location",
                            icon: const Icon(
                              Icons.location_on,
                              color: Colors.blue,
                              size: 15,
                            ),
                            textColor: Colors.blue);
                        break;
                      case 1:
                        sticker =
                            _buildSticker("@mention", textColor: Colors.orange);
                        break;
                      case 2:
                        sticker = _buildSticker("ADD YOURS",
                            icon: const Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.red,
                              size: 15,
                            ),
                            textColor: Colors.red);
                        break;
                      case 3:
                        sticker =
                            _buildSticker("questions", textColor: Colors.blue);
                        break;
                      case 4:
                        sticker = _buildStickerImage(
                            "assets/story_gifs/heart_roaming.gif");
                        break;
                      case 5:
                        sticker = _buildStickerImage(
                            "assets/story_gifs/heart_flash.gif");
                        break;
                      case 6:
                        sticker = _buildStickerImage(
                            "assets/story_gifs/broken_heart.gif");
                        break;

                      default:
                    }
                    return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: sticker,
                        ));
                  }))
        ],
      ),
    ));
  }
}

Widget _buildSticker(String name,
    {Widget? icon, Color textColor = Colors.blue}) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(5)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (icon != null) ...[
          icon,
        ],
        Text(
          name.toUpperCase(),
          style: TextStyle(
            color: textColor,

            // fontSize: size,
          ),
        )
      ],
    ),
  );
}

Widget _buildStickerImage(
  String imageName,
) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          imageName,
          fit: BoxFit.cover,
        ),
      ],
    ),
  );
}
