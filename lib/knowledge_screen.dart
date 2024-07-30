import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class KnowledgeScreen extends StatelessWidget {
  const KnowledgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back, color: Colors.black),
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
          SizedBox(height: 20), // Space after AppBar
          Container(
            width: screenWidth,
            height: screenHeight * 0.3, // Adjust height for carousel
            child: CarouselSliderWidget(),
          ),
          SizedBox(height: 10),
          Text(
            "Related Posts",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Expanded(child: RelatedPostsWidget(screenWidth: screenWidth)),
        ],
      ),
    );
  }
}

class CarouselSliderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance
          .collection('plugins')
          .doc('44550danTf07nzJwpAvK')
          .collection('blogs')
          // Filter documents
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error loading carousel images'));
        }

        final documents = snapshot.data!.docs;
        List<Widget> imageSliders = documents.map((doc) {
          return Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Image.network(
                    doc['url'],
                    fit: BoxFit.cover,
                    width: double.infinity, // Use full width
                  ),
                  
                ),
                
              ),
            ],
          );
        }).toList();

        return CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            viewportFraction: 1.0,
          ),
          items: imageSliders,
        );
      },
    );
  }
}

class RelatedPostsWidget extends StatelessWidget {
  final double screenWidth;

  RelatedPostsWidget({required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance
          .collection('plugins')
          .doc('44550danTf07nzJwpAvK')
          .collection('blogs')
          // Filter documents
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error loading related posts'));
        }

        final documents = snapshot.data!.docs;
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            childAspectRatio: 0.7, // Adjust the aspect ratio as needed
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: documents.length,
          itemBuilder: (context, index) {
            final doc = documents[index];
            final timestamp = (doc['timestamp'] as Timestamp).toDate();
            final formattedDate = DateFormat.yMMMd().add_jm().format(timestamp);

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: Image.network(
                      doc['url'],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: screenWidth * 0.4, // Adjust the height as needed
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    doc['mainTitle'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(doc['subTitle']),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // // Text(
                      //   doc['name'],
                      //   style: TextStyle(fontSize: 16, color: Colors.grey),
                      // ),
                      Text(
                        formattedDate,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
