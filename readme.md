# Homework 4 :: CP 125 iOS App Dev, Spring 2015 #

The files for this homework are also available at the following
repository on GitHub:

>  <https://github.com/carljparker/layout-constraints-uw-ios-hw3>

The app for this homework displays a list of birthday information and
also provides a UX to add additional birthdays to the list.

The app is implemented using two navigation controllers each with an
integrated table view controller. The table view for the birthday list
uses dynamic cell creation where the data for the displayed cells is
represented by an array of `BDayPerson` objects. The table view for the
add-birthday UX uses static cells.


## Dismissing the Add-Birthday UX ##

The add-birthday UX can be dismissed using either the **Cancel** or
**Done** buttons. 

I implemented the **Cancel** button by creating the following outlet
manually in the view-controller class for the birthday list
(`BDayListTableViewController.m`):

    (IBAction)unwindToList:(UIStoryboardSegue *)segue; {
            NSLog(@"%@", @"Cancel button dismissal of Add-Birthday UX");
    }

Then, in interface builder (IB), I dragged from the **Cancel** button to
the Exit icon in the header of the **Root View Controller** of the
add-birthday UX and selected the above outlet in the list that was
presented.

I implemented the **Done** button by creating a custom delegate in the
add-birthday view controller class. The birthday-list view controller
class implements this delegate. The delegate receives the new birthday
and adds it to the list, then dismisses the add-birthday UX.


## Layout ##

The layout of the UI was done in `wAny hAny` and tested only with iPad
Retina.


## Know Issues ##

There is an issue in the app where, when typing a name into the
add-birthday UX, the first letter of the name sometimes is displayed in
lowercase irrespective of how it was typed. I suspect that this issue
does not reside in my code, but is instead an artifact of the iOS
simulator or the larger Xcode environment. In any case, I did not
attempt to debug this issue.


*** END ***

