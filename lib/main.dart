import 'package:flutter/material.dart';
//Importing storyBrain
import 'story_brain.dart';

//Main App
void main() => runApp(Destini());

//A stateless widget is being used to take care of all the non changing conponents of the app
class Destini extends StatelessWidget {
  const Destini({super.key});

  @override
  Widget build(BuildContext context) {
    //Material App is being built
    return MaterialApp(
      //Body of the entire functional part of the app
      home: StoryPage(),
    );
  }
}

//Object storyBrain is accesing the StoryBrain class
final StoryBrain storyBrain = StoryBrain();

//Stateful widget is created to change the necessary elements and update it.
class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    //Scaffold widget is getting built
    return Scaffold(
      body: Container(
        //Box Decoration is added to decorate the Container
        decoration: BoxDecoration(
          //Background image is being added
          image: DecorationImage(
            //Background image is locally stored in 'assets' folder
            image: AssetImage('images/background.png'),
            //Background image is made to cover the entire container.
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(25.0),
        child: SafeArea(
          // Column widget is being added to set all the childern aligned vertically
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  //flex is used to give the widget 12 portions of the screen space
                  flex: 12,
                  child: Center(
                    child: Text(
                      //Fetching story list from StoryBain file
                      storyBrain.getStory(),
                      //Text style is being added to style the text
                      style: TextStyle(
                        //White color is added in contrast for the dark background
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        //Font Size is set to 22 pixels
                        fontSize: 25.0,
                      ),
                    ),
                  )),
              //Green Button of the App.
              Expanded(
                //flex is used to give the expanded widget 2 portions of the secreen space
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    //Green color is given to the background of the button
                    color: Colors.green,
                    //Gesture Detector is being used to take care of all the tap inputs
                    child: GestureDetector(
                      onTap: () {
                        //The button is given a function where when pressed it gives the output of int 1
                        storyBrain.nextStory(1);
                        //Set state is used to change the state and update it
                        setState(() {
                          //On tapping the button the next story from the storyData list is being updated on the screen
                          storyBrain.getStory();
                        });
                      },
                      child: Center(
                        child: Text(
                          //Text Align is used to center all the choices in the center of the button
                          textAlign: TextAlign.center,
                          // Object storyBrain is accessing the StoryBrain for the choice1 in the storyData list
                          storyBrain.getChoice1(),
                          style: TextStyle(
                            //White color is given to contrast the green color
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //Sized Box is used to change the vertical height by 20 pixels
              SizedBox(
                height: 20.0,
              ),
              //Visibility widget is used to change the visibility of the particular button
              Visibility(
                //When buttonshouldBeVisibile() returns the bool false this particular button becomes invisible
                visible: storyBrain.buttonShouldBeVisible(),
                //Blue Button of the App
                child: Expanded(
                  //flex is used to give the expanded widget 2 portions of the screen space
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      //The button background color is set to blue
                      color: Colors.blue,
                      //Gesture Detector is being used to take care of all the tap inputs
                      child: GestureDetector(
                        onTap: () {
                          //The button is given a function where when pressed it gives the output of int 2
                          storyBrain.nextStory(2);
                          //Set state is used to change the state and update it
                          setState(() {
                            //On tapping the button the next story from the storyData list is updated on the screen
                            storyBrain.getStory();
                          });
                        },
                        child: Center(
                          child: Text(
                            //Text Align is used to center all the choices in the center of the button
                            textAlign: TextAlign.center,
                            // Object storyBrain is accessing the StoryBrain for the choice2 in the storyData list
                            storyBrain.getChoice2(),
                            style: TextStyle(
                              //White color is given to contrast the blue color
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
