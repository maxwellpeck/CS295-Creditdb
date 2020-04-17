# **CreditDB**
iOS Project for UVM CS295

## Features and Screenshots
| Master View | Detail View |
| :---: | :---: |
| ![alt text](https://raw.githubusercontent.com/maxwellpeck/Creditdb/master/Screenshots/MasterView.png) | ![alt text](https://raw.githubusercontent.com/maxwellpeck/Creditdb/master/Screenshots/DetailView.png) |
* **Credit Cards:** Credit cards are displayed in the master view with a nickname, current balance, and the expiration date  (Prototype cell type 1).
* **Debit Cards:** Debit cards are displayed in the master view with a nickname, and the name of the issuing bank (Prototype cell type 2).

| Credit Card Prototype Cell | Debit Card rototype Cell |
| :---: | :---: |
| ![alt text](https://raw.githubusercontent.com/maxwellpeck/Creditdb/master/Screenshots/CreditCardPrototypeCell.png) | ![alt text](https://raw.githubusercontent.com/maxwellpeck/Creditdb/master/Screenshots/DebitCardPrototypeCell.png) |

## Technical Elements
* **UITableView:** 2 prototype cells; one for displaying credit cards and one for debit cards.
* **UINavigationController:** Manages transitions between views.
* **Mastr-Detail Interface:** Datail interface uses multiple UIStackViews to organize layout.
* **Editable and Safe:** User can edit and delete items, after user is prompted to confirm deletion.
* **Master View Editing Capabilities:** Edit and add credit cards with "+" and "Edit" buttons in a UINavigationBar
* **Delete from Detail View:** User can delete credit card from within detail view with a trash can button in a UIToolBar.
* **Archiving:** Data is saved upon exiting, so it can be viewed between invocations of the app.

## Credits
* **Big Nerd Ranch:** This is an iOS application based on some of the teachings from the iOS Programming textbook from Big Nerd Ranch and lecture.
* **App Icon:** Photo used from https://www.vectorstock.com/royalty-free-vector/credit-card-black-icon-vector-20234947.
