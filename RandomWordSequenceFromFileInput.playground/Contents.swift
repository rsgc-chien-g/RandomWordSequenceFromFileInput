import Cocoa
/*:

# Building Word Probabilities From a File

**This exercise is the final "in-between" step before you actually build a Markov Bot using words.**

In this final "in-between" step – you will generate random *sentences* based on individual *word* probabilities.

(Recall that in the previous "in-between" step, you [generated an output *string* of composed of individual *characters*](https://github.com/rsgc-ics3u-2015/RandomLetterSequenceOfUnknownLength). Characters for the output string were selected based on the character probabilities from an input string of random length).

## Getting Started

For today's exercise, you need an input file to work with (or you can use the one provided).

Once you locate your file, here is how to add it to the Playground you are using.

Make the lefthand file Navigator visible:

![leftnav](leftnav.png "Show the file Navigator")

Then drag the source text into the Resources folder, like this:

![draganddrop](draganddrop.png "Drag a file to the resources folder")

Review following steps carefully.

Change the code so that the program loads the text file you have found.

*/

// Set location of file
// File obtained from:
// http://www.presidentialrhetoric.com/campaign/speeches/bush_oct19.html
// Only edits:
// - Removed text "AUDIENCE: ..."
// - Removed text "(Applause.)"
// - Removed text "(Laugther.)"
// – Removed text "THE PRESIDENT:"

// Set the location of the file
let fileURL = NSBundle.mainBundle().URLForResource("bush-speech", withExtension: "txt")

// Get the contents of the file, and place in a String.
// Note that this loads entire file into memory.
// Not efficient for very large files.
let content = try String(contentsOfURL: fileURL!, encoding:
    NSUTF8StringEncoding)

// Review the result (click the + button in the sidebar to show the result)
content

/*:

You should see that you now have a variable that contains the entire contents of a text file.

In the [prior exercise](https://github.com/rsgc-ics3u-2015/RandomLetterSequenceOfUnknownLength/blob/master/RandomLetterSequenceOfUnknownLength.playground/Contents.swift#L50-L64), we were able to inspect each *character* of the input string.

To continue with **this** exercise, working with words, we need to be able to inspect each individual word.

To do this, we will break up the string that contains the entire contents of the input file into an *array*.

Each word from the input file will be a separate element in the array.
*/

// Set the delimiters we will use to break up the string
let delimiters = NSCharacterSet(charactersInString: ", \n")

// Break the string up into an array using delimiters created above
let words = content.componentsSeparatedByCharactersInSet(delimiters)

// Review the contents of the array (click the + button in the sidebar to show the result)
words
/*:

Now you have the entire contents of your text file, separated into individual words, and stored in a regular array.

Proceed with goal #1, described below.

## Goal 1

### Input Specifications

You have an array with each element representing a single word from the input text.

### Output Specifications

Generate a "sentence" with 20 words in it. Each word in the sentence should occur relative to the probability with which it occurred in the input text.

### Algorithm

Below, write out an algorithm that will accomplish this task.

This time, include the following sections:

* Algorithm (point form)
* Assumptions (if any)
* Data Structures (identify data structures you might make use of)

### Implementation

Implement your algorithm further down, below where you typed out your algorithm.

Remember to save and commit your work to GitHub when you have completed a part of the solution that you don't want to lose.  Definitely commit your work when the algorithm is fully implemented.
*/

/*

Goal #1
=======

My algorithm
------------
Count the total number of letters and create a array and make a value for each letter

My assumptions
--------------
The string of letter will not make sense as they are random

Probable data structures
------------------------
array, for loop, conditionals

*/

// Implement Goal #1 below...

var wordCounts = [String: Int]()

wordCounts

for word in words
{
    if wordCounts[word] == nil
    {
        wordCounts[word] = 1
    }else{
        wordCounts[word]! = wordCounts[word]!+1
        
    }
}

var totalWordCount = Float(words.count)
var percentage = [String: Float]()

for (word, counts) in wordCounts
{
    percentage[word] = Float(counts) / totalWordCount * 100
}

percentage
var outputString = ""
var upperValue: Float = 0.0

for _ in 1...20
{
    let randomValue = Float(arc4random_uniform(100))
    
    for(letter, probabilities) in percentage
    {
        upperValue += probabilities
        if (randomValue > upperValue)
        {
            outputString += String(letter)
            break
        }
    }
}
outputString
/*: 

## Goal 2

### Extension

Use the data structures you created for Goal #1 above.

### Output Specifications

Generate a random output sentence, **without a pre-determined length**. The sentence should simply end with a word that includes a period as it's final character.

### Algorithm

Below, write out an algorithm that will accomplish this task.

This time, include the following sections:

* Algorithm (point form)
* Assumptions (if any)

### Implementation

Implement your algorithm further down, below where you typed out your algorithm.

Recall that from earlier work, [you know how to inspect the final character of a string in Swift](https://github.com/rgordonatrsgc/MarkovChainsIntroduction/blob/8e5488cd90cd5592c5553d085c0ce0728b1a1612/MarkovChainsIntroduction.playground/Contents.swift#L43-L50).

Remember to save and commit your work to GitHub when you have completed a part of the solution that you don't want to lose.  Definitely commit your work when the algorithm is fully implemented.
*/

/*

Goal #2
=======

My algorithm
------------


My assumptions
--------------



*/


// Implement Goal #2 below...


/*:

## Goal 3

### Extension

Use the data structures you created for Goal #1 above.

### Output Specifications

Generate a random output sentence that has at least 8 words in it, but no less. The sentence should end with a word that includes a period as it's final character.

### Algorithm

Below, write out an algorithm that will accomplish this task.

This time, include the following sections:

* Algorithm (point form)
* Assumptions (if any)

### Implementation

Implement your algorithm further down, below where you typed out your algorithm.

Remember to save and commit your work to GitHub when you have completed a part of the solution that you don't want to lose.  Definitely commit your work when the algorithm is fully implemented.
*/

/*

Goal #3
=======

My algorithm
------------


My assumptions
--------------


*/


// Implement Goal #3 below...


