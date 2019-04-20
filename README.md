# Terminal Medication Tracker

A simple medication tracker, created with ruby, used in the terminal. The purpose of this app was for me to practice OOP.

## Description of the ​app

### Purpose

The app is intended for people who take a lot of medication to be able to track their medication, have a place to show all the medication they take (for instance, to show their doctors), and a history of the medication they have taken (again, to show doctors etc.)

The purpose of the app was also for me to create a MVP to practice object oriented programming.

### Functionality

The user is able to select from a simple menu to either:

* Take Medication (record what they have taken)
* See Medication (a list of their medication)
* See History (a list of the medication they have taken)

The idea was to have a simple program that is easy to navigate, as the user in mind is not very technically savy. They are also not able to add their own medication or change the dose they take - with the idea that in future versions a doctor or carer could add/change this information for the user.

### Instructions for use

To use this app, clone or fork it to your computer. You can install the required gems through bundle install:

`bundle install`

To run the app, in terminal type: `ruby app.rb`

### Future enhancements

* Be able to have more than one user on the app, have them be able to sign up and choose their own pin
* Be able to have different user types - a doctor/carer section that has more options to customize
* Save history to a file
* More sophisticated checking if the medicine has been taken already
* Be able to have reminders to take medicine
* Make the history section nicer looking, especially with date formatting
* Option to refill script.

### Accessibility concerns

It was my intention to have this app be very accessible, as the target audience may have various disabilities. The app was designed to be easy to navigate.

One concern is the tty-prompt gem - the characters that it uses might not work in all terminals. In some terminals it only displays a box with a question mark. However, even with the incorrect character showing, the program is still fully functional. 

### Potential legal, moral, ethical, cultural and safety issue

Because this app is intended for the elderly or people with many medical concerns, around taking medication, there is a bunch of ethical issues surrounding it. For instance, the user over taking their medication if the app reminds them to take medication yet they already have on that day.

The app is designed so that the main user is not able to change their own medication schedule. This is from a safety standpoint, for instance those who require a carer, or so that doctors can assign the correct dosage. The idea is that a carer can change the details, however there is potential for a carer to misuse the app.

If this app was to be released into the wild, there would need a whole heap of legal disclaimers and safety precautions put in before it could be used. 

### Description of overall app design (classes, files, basic flow)

This app was created to practice OOP. I created two classes so far - User and Medication.

The history variable is an array of hashes. Each array has a time (that the medication was taken), the name of the medicine, and the dose (in an array with [qty of medicine, unit of qty] - such as [2, tablets]). 

The medication that a user takes is a hash with the medicine's name as the key, and the medicine object as the value.

Each individual medication is a subclass of the overall medication class.

The main app flows through a loop, returning to the main menu until the user quits. 