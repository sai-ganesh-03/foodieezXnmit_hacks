import 'package:flutter/material.dart';
// import 'package:rating_bar/rating_bar.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {

  TextEditingController _controller = TextEditingController();
  bool _isChecked = true;
  double _rating = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg_img.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Upload video",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Divider(height: 2,),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: TextFormField(
                            controller: _controller,
                            decoration: InputDecoration(
                              labelText: 'Description',
                              hintText: 'mouth watering hungry!!!',
                            ),
                            maxLines: 5,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Add description...';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              // Do something with the value entered
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){},
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.contain,
                        height: 120,
                        width: 120,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Enter the location',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Location';
                  }
                  return null;
                },
                onSaved: (value) {
                  // Do something with the value entered
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Tag someone',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Tag';
                  }
                  return null;
                },
                onSaved: (value) {
                  // Do something with the value entered
                },
              ),
              SizedBox(height: 30,),
              // RatingBar(
              //   onRatingChanged: (rating) => setState(() => _rating = rating),
              //   filledIcon: Icons.star,
              //   emptyIcon: Icons.star_border,
              //   halfFilledIcon: Icons.star_half,
              //   isHalfAllowed: true,
              //   filledColor: Colors.green,
              //   emptyColor: Colors.redAccent,
              //   halfFilledColor: Colors.amberAccent,
              //   size: 48,
              // ),
              SizedBox(height: 30,),
              ElevatedButton(
                onPressed: () {
                  // Do something when the button is pressed
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Set the background color of the button
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [// Add the prefix icon
                    SizedBox(width: 25),
                    Icon(Icons.upload), // Add the prefix icon
                    SizedBox(width: 5), // Add some spacing between the icon and the text
                    Text('Upload'), // Add// Add the prefix icon
                    SizedBox(width: 25),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
