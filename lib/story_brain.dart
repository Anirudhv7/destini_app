//Importing Story class from story.dart file
import 'story.dart';

//New Class called Storybrain is being created which consits a list with Story type called storyData
// The storyData list has a type Story with a constructor which can only have string called storyTitle, String choice1 and String choice2
class StoryBrain {
  //The '_' is used to make the list _storyData a private list
  final List<Story> _storyData = [
    Story(
        storyTitle:
            'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
        choice1: 'I\'ll hop in. Thanks for the help!',
        choice2: 'Better ask him if he\'s a murderer first.'),
    Story(
        storyTitle: 'He nods slowly, unphased by the question.',
        choice1: 'At least he\'s honest. I\'ll climb in.',
        choice2: 'Wait, I know how to change a tire.'),
    Story(
        storyTitle:
            'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        choice1: 'I love Elton John! Hand him the cassette tape.',
        choice2: 'It\'s him or me! You take the knife and stab him.'),
    Story(
        storyTitle:
            'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        choice1: 'Restart',
        choice2: ''),
    Story(
        storyTitle:
            'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        choice1: 'Restart',
        choice2: ''),
    Story(
        storyTitle:
            'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        choice1: 'Restart',
        choice2: '')
  ];
// getStory() is used to return the the current story based on the story number
  String getStory() {
    return _storyData[_storyNumber].storyTitle;
  }

//getChoice1() is used to return the choice1 from the _storyData list at the current _storyNumber
  String getChoice1() {
    return _storyData[_storyNumber].choice1;
  }

//getChoice2() is used to return the choice2 from the _storyData list at the current _storyNumber
  String getChoice2() {
    return _storyData[_storyNumber].choice2;
  }

//_storyNumber tracks the current story number and is set to 0 as default
  int _storyNumber = 0;
//nextStory() is used to change the story of based on the user's input
  void nextStory(int choiceNumber) {
    if (_storyNumber == 0) {
      if (choiceNumber == 1) {
        _storyNumber = 2;
      } else if (choiceNumber == 2) {
        _storyNumber = 1;
      }
    } else if (choiceNumber == 1 && _storyNumber == 2) {
      _storyNumber = 5;
    } else if (choiceNumber == 2 && _storyNumber == 2) {
      _storyNumber = 4;
    } else if (_storyNumber == 1 && choiceNumber == 1) {
      _storyNumber = 2;
    } else if (choiceNumber == 2 && _storyNumber == 1) {
      _storyNumber = 3;
    } else if (_storyNumber == 3 || _storyNumber == 4 || _storyNumber == 5) {
      _storyNumber = 0;
    }
  }

//This Method is used to to show the visibility of the button based on bool trure or false
//If the _storyNumber 0, 1 or 2 is in these numbers then it returns true
//If the _storyNumber 3,4 or 5 is in these numbers then it returns false
  bool buttonShouldBeVisible() {
    if (_storyNumber == 0 || _storyNumber == 1 || _storyNumber == 2) {
      return true;
    } else {
      return false;
    }
  }
}
