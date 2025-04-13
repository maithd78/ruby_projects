# MASTERMIND IN A OOP WAY
## play a round of mastermind 

Choose to either guess a randomly generated code or write a your own secret color code for the computer to guess

### How the computer guesses your secret code

currently implements the Swaszek (1999-2000) method. by choosing a random possibility from the remaining possibilities.

The computer will start by eliminating the first two colors available in the list of colors and then systematically elimanate any color codes that do not return the same feedback as the first guess.

### TO-DO 

Implement a method to implement a minimax technique to choose the next posible guess.

Add some UI elements.
