import 'package:flutter/material.dart';

class KnowledgeScreen extends StatelessWidget {
  const KnowledgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back),
        title: Center(
          child: Text(
            "Knowledge Center",
            style: TextStyle(
              color: Color.fromRGBO(33, 35, 38, 1),
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20), // Add space after AppBar
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Row(
              children: [
                Container(
                  width: screenwidth * 0.5,
                  height: screenheight * 0.18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    //color: Colors.black,
                  ),
                  child: Image.asset(
                    'assets/images/google-ai.png',
                    //fit: BoxFit.cover,
                  ),
                ),
                // Add some space between the image and the text
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Google AI Expert",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Learn about all the AI features available on Google Pixel phones and become the Google AI Expert",
                        style: TextStyle(),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.blue)
                            // color: Colors.transparent,
                            ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 8),
                          child: Text(
                            'Learn More',
                            style: const TextStyle(
                              // fontSize: 45,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 10,
          ),
          Text(
            "Related Posts",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/first.png',
                width: screenwidth * 0.4,
                fit: BoxFit.contain,
                //height: screenheight * 0.15,
              ),
              SizedBox(
                width: 20,
              ),
              Image.asset(
                'assets/images/two.png',
                fit: BoxFit.contain,
                width: screenwidth * 0.4,
                //height: screenheight * 0.15,
              )
            ],
          ),

          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/third.png',
                width: screenwidth * 0.4,
                fit: BoxFit.contain,
              ),
              SizedBox(
                width: 20,
              ),
              Image.asset(
                'assets/images/fourth.png',
                width: screenwidth * 0.4,
                fit: BoxFit.contain,
              )
            ],
          ),

          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
