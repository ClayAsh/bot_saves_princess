# BOT SAVES PRINCESS

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-this-project">About This Project</a>
      <ul>
        <li><a href="#tools-used">Tools Used</a></li>
      </ul>
    </li>
    <li>
      <a href="#how-to-use-bsp">How to Use Bot Saves Princess</a>
      <ul>
        <li><a href="#hacker-rank">Hacker Rank</a></li>
        <li><a href="#download-this-repo">Download this Repo</a></li>
        <li><a href="#ruby-runner">Ruby Runner</a></li>
      </ul>
    </li>
    <li><a href="#solutions">Solutions</a></li>
    <ul>
        <li><a href="#bot-saves-princess-1">Bot Saves Princess 1</a></li>
        <li><a href="#bot-saves-princess-2">Bot Saves Princess 2</a></li>
      </ul>
  </ol>  
</details>

<!-- ABOUT THIS PROJECT -->
### About This Project
---
Bot Saves Princess & Bot Saves Princess 2 are Ruby programs built to return the path that a robot must take to find the princess. 
To visit the original Hacker Rank challenges, follow the links below. 

* [Bot Saves Princess 1](https://www.hackerrank.com/challenges/saveprincess)
* [Bot Saves Princess 2](https://www.https://www.hackerrank.com/challenges/saveprincess2)

BOT SAVES PRINCESS 

In Bot Saves Princess, the princess is trapped in one of the four corners of the grid, while the bot starts in the middle of the grid. In this challenge, the user enters an odd grid size between 3 & 100 and is also asked to enter in the rows of the grid using '-' for empty squares, 'p' for the princess and 'm' for the bot. 
To complete the challenge you must return a series of one line directions the bot will take to get to the princess in as short of a path as possible.</br>

<img width="245" alt="Screen Shot 2022-09-09 at 2 04 18 PM" src="https://user-images.githubusercontent.com/99059063/189434427-f8c511c7-efbc-41ea-a535-9f9216aa788f.png">

BOT SAVES PRINCESS 2 

In Bot Saves Princess 2, the princess and the bot can be located anywhere on the grid. In this challenge, the user enters a grid size that is less than 100, the x & y coordinates for the bot, as well as the rows in the grid using '-' for empty squares, 'p' for the princess and 'm' for the bot.
To complete the challenge you must return the next move the bot will take to rescue the princess.</br>

<img width="272" alt="Screen Shot 2022-09-09 at 2 06 11 PM" src="https://user-images.githubusercontent.com/99059063/189434580-0b04b2ab-6278-4a36-bb09-8d784d30b1c6.png">
<br>

### Tools Used 

BUILT WITH 
  * [Ruby v2.7.4](https://www.ruby-lang.org/en/)

TESTED WITH
* [RSpec v3.11](https://rspec.info/)
* [Pry](https://pry.github.io/)
* [Simplecov](https://github.com/simplecov-ruby/simplecov)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- HOW TO USE BOT SAVES PRINCESS -->
### How to Use Bot Saves Princess
---
#### Hacker Rank 

To run my solution for Bot Saves Princess in the Hacker Rank challenge:
* Visit [Bot Saves Princess 1](https://www.hackerrank.com/challenges/saveprincess)
* Copy the contents of bot_saves_princess/HR_save_princess.rb 
* Paste the solution in the Hacker Rank text editor 
* Press "Run Code" which will generate a board
* Press the Play button below the board
* This will display the sample input and the Output from the program

To run my solution for Bot Saves Princess 2 in the Hacker Rank challenge:
* Visit [Bot Saves Princess 2](https://www.https://www.hackerrank.com/challenges/saveprincess2)
* Copy the contents of bot_saves_princess/HR_save_princess_2.rb 
* Paste the solution in the Hacker Rank text editor 
* Press "Run Code" which will generate a board
* Press the Play button below the board
* This will display the sample input and the Output from the program

#### Download this Repo

To install locally, in the command line run: 
* git clone git@github.com:ClayAsh/bot_saves_princess.git
* cd bot_saves_princess 
* bundle install 

#### Ruby Runner 

To play Bot Saves Princess after installing locally, in the command line run: 
* ruby save_princess/save_princess_runner.rb 

To play Bot Saves Princess 2 after installing locally, in the command line run: 
* ruby save_princess_2/save_princess_2_runner.rb 

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- SOLUTIONS -->
### Solutions

Design</br>
Because the Hacker Rank prompts for these challenges are somewhat vague, some interpretation and design decisions had to be made. 
I choose to focus on simplicity and elegance over complexity in the design of this program. Initially I created a Bot class and Princess class, but after discovering that the functionality of the program hinges largely on the bot and princess coordinates, and that these are provided by the user as per the sample input on the Hacker Rank website, I choose to scale the program back to deliver the required responses in as little code as possible, while still remaining robust in my logic. 

Testing & Error Handling</br>
This program relies heavily on correct user input, so testing sad paths was very important. The focus of this program's sad path testing is error handling for instantiation of the Grid class, as this is the only opportunity for user input. I choose to leverage Ruby's inbuilt ArgumentError functionality within the initialize method of the Grid class because many errors in input cannot be detected until the Grid class is instantiated & it attempts to build a grid as well as princess and bot locations using user input. 

Other Solutions</br>
One possible interpretation of the Bot Saves Princess 2 Hacker Rank prompt was for the program to generate the grid with a random placement of the princess. This seemed like an unlikely interpretation given the grid being entered by the user in the sample input, however I built out a method for random princess placement for possible future expansion on this challenge. 

To build a more robust program for use locally, an ideal solution would be to have the program place the princess and bot without the need for the user to input the grid, user input being the primary weakness of this program. 

#### Bot Saves Princess 1 

Classes and Methods</br>
1) Grid Class</br>
  The Grid class's primary responsibility is grid creation and capturing the locations of the bot and princess utilizing user input. The Grid class is also tasked with error handling, as it is the only class that receives user input. This class requires two arguments, size, which is used to generate the grid size, and grid, which is an array of strings representing the grid. 
  * find_element is a Grid class instance method that iterates over the grid, returning the index positions in both the row and column for the bot & princess. In keeping with DRY principals, I designed this method to find either the bot or the princess depending on an argument provided in the initialize method.

2) Save Princess Class</br>
  The Save Princess class takes in a grid as an argument upon instantiation & leverages the Grid class's find_element method to easily receive the location of the bot and princess from the grid class. Save Princess is responsible for returning instructions for finding the princess.
  * find_path is a Save Princess instance method that subtracts the first index position of the bot coordinates from the first index position of the princess coordinates to determine if the first move is "UP" or "DOWN". It uses the difference of the equation to determine how many times it must move in one direction & stores the move as a string in an array. It then repeats this process with the second index position of the bot and princess to determine if the next move is "LEFT" or "RIGHT".

#### Bot Saves Princess 2 

Classes and Methods</br>

Bot Saves Princess 2 utilizes the same structure as Bot Saves Princess with only a couple of deviations. 

1) Grid Class</br>
  The Grid class in this challenge has all of the same functionality as in challenge 1, but requires four arguments, taken from user input. The first argument is size, which determines the size of the grid, and must be under 100. The next two arguments, bot_x & bot_y determine the placement of the bot on the grid, representing it's coordinates. The last argument is grid, which is an array of strings representing the grid. 

2) Save Princess Class</br>
  The Save Princess class takes in a grid as an argument upon instantiation and again captures the coordinates of the bot & princess with the help of the grid class. 
  * find_move is a Save Princess instance method that is responsible for returning just the first move for the bot to find the princess. It uses the same logic as find_path in Bot Saves Princess but only returns one string. 


<br>
<p align="right">(<a href="#top">back to top</a>)</p>
