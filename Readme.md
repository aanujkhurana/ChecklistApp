#Assignment 1

##milestone 2

##Overview
In milestone 2, I updated my App "Checklist" that displays MVVM user inferace.
Interactive checklists, can add checklist edit title, add items to checklist.
delete checklists and/or items. Check or Uncheck items, reset all checks and undo reset functions.
 
##In Milestone 2 I learnt:
.Create data model and view in swiftUI
.creation of a navigation view and navigation link
.implementation of binding variables and state variables
.creation of buttons with custom views and mutiple functions
.how to edit add and delete from lists
.how to create lists of lists
.loading and saving data into a "JSON" file
.the transition between views 
.how to write to file and save using onappear and ondissappear functions

##For MILESTONE 2 I implemented:
This milestone's goal is to delve deeply into the Model-View-ViewModel (MVVM) paradigm and SwiftUI.
Checklist App has been updated milestone 1 for this milestone 2, all the commits can be seen on git. The Master View (CheckListsView) for this milestone shows a collection of checklists which is created in DataModel as a stuc and has array of items which is also a stuc in datamodel.  The name of each checklist is displayed in CheckListsView.  Additionally, navbar has two buttons: [Add +] for adding a new checklist, and [Edit] for going into edit mode, which enables deletion and/or index positioning of checklists. The ChecklistView has a collection of checklists embedded within it. Each checklist contains a Navigation Link that, when tapped, will take the user to a view that displays the associated checklist items (ItemsView).  The user will be able to engage with the checklist items in the ItemsView by checking and unchecking items bu tapping on items this will change the status of app in datamodel. Additionally, there is an Edit button that can be used to further delete and move items. There is also a reset and undo option, which unchecks every item. Also, the "undo reset" button guarantees that the user can restore the status of the checked items. This is achived by using using if statement in UndoResetButton View to display two titles and have two functions in a single button. The datamodel also contains functions to save and load from .json file to save and load app data. 

##video link milestone 2:
https://youtu.be/-0iJTLpbhWk
