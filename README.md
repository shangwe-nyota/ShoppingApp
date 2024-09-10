# ShoppingApp
Basic Shopping Calculator

Creative Portion:
What you implemented
-For my creative portion, I implemented 2 small features. Firstly, anytime you are entering input, you can reset the screen by pressing the "clear" button". The other feature is a Euros converter, that once you have a final price listed in dollars, you can press the "Euros" button and it will display the price in Euros.

How you implemented it
-I implemented the clear functionality by adding both an outlet and action to the codebase. Whenever the user presses on the button, I set the originalPrice, discountPrice, and salesTax variables to nil and set their repsective text fields to empty strings. I then call the updateFinalPrice() function to update the screen accordingly. I implemented the euros conversion feature by using the euro exchange rate and taking the finalPrice which is in dollars and when the euros button is presssed multiplying the final price by the exchange rate and then displaying the converted value in euros to the screen rounded.

Why you implemented it
-I implemented the clear button because it can be quite tedious to have to manually clear all the entries when restarting. Imagine everytime for a new set of values, one must manualy clear the original price, discount, sales tax, and final price displays... that would be quite tiring! With the clear button a user can simply press the button to refresh the selections. I added the euros button as not all of the users of the app may be american and many may come from Europe so having an exchange rate would defintely help appeal to a greater target audience. Additionally many people travel to europe for various reasons such as holidays, so having this feature could definetly help with that regard!
