
# Improvments I would make if it would not be a demo applicaion

## 1.Core data or SQL lite data storing
Using UserDefaults for storing Weather object's is not a good pratice. Usually I do not like to store custom objects in UserDefaults. A correct solution for that is to use Core Data or SQLite database

## 2. LocalizationManager with JSON file
Using hard code defined strings is not a good pratice. One of the correct way is to define strings in a JSON file, as it allows users to change the application language without changeing the phone default language.

## 3. Finishing network layer
The network layer is not finished yet. It needs several improvments, but it satisfies every requirement of our application. I decided not to go with a third party library for networking as is Alomfire or Moya. I think it is an overkill for this application(and for many othrer applications also). Having your own network layer enables you to debug and test your code more easily. And once you know that it works fine, it can be reused on other projects.

# Other notes

- I was trying to make the application to support devices down to iphone 5 with iOS 10, but that is not fully tested, as I was working with a iPhone 11 Pro Max simulator and a iPhone X device.
- One requirement was to install a pod for gradient background, but I decided not to go with it, as it can be done really easily with few lines of code. Instead, I installed SwiftLint. It's a great library for enforcing Swift styles and conventions.
