#Assignment 1

##milestone 1

##Overview
In milestone 1, I created an App "Checklist" that displays single user inferace.
Static checklist, some items are checked(Pink checkmark) and some unchecked(No checkmark).

##In Week 2 I learnt:
.Basic of Swift and SwiftUI and what is an Anatomy of an App
.Single View App and master/Detail View app with simple GUI.
.the importance of playground how to use it.
.struc, classes, functions, closeurs, let and var. 
.How to create test function and run test using test data.
.How to Commint on git and check history of code and tag brances.

##For Assignment 1 (checklist App) I implemented:
1. created new ios single GUI xcode app.
2. added basic structure to content view with Vertical stack (Vstack).
3. added Text for headline in Vstack.
4. Created a array of strings called Checklists with two item, the check status and the name of the item.
5. added a list tag in vstack for checklist item.
6. Using foreach loop the checklist items are displayed in list.
7. image of check tick mark is displayed using for loop to check the status of each item.
8. Text and image tag for wrapped in Horizonal stack (Hstack) and a spacer tag is added to use whole display which adds space between text and image.
9. Using modifiers the overall desired look is achivied.
10. Extracted the Hstack including text and Tickmark using extract subview and renamed the tag.
11. Moved extracted subview in a new file called ChecklistView and also moved the Array of Checklists to the same file.
12. Build the app to check everything is working.
13. Added ontap guesture to add print function, commited again after checking & building app.
14. Added datamodel and XCT tests and commit tagged as milestone 1. 

##video link:
https://youtu.be/Uaq5kmZpZVE
