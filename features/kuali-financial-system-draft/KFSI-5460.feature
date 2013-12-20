@KFSI-5460 @Draft
  Feature: KFSI-5460

  Description:
    KFSI5460-01:  Receiving preq job approves receiving node on preq with
                  correct tax amount
    KFSI5460-01-01 - Create Requisition
    KFSI5460-01-02 - Approve Requisition      (Requires 01-01 to be successfully run)
    KFSI5460-01-03 - Assigns Contract Manager (Requires 01-02 to be successfully run)
    KFSI5460-01-04 - Create PO                (Requires 01-03 to be successfully run)
    KFSI5460-01-05 - Approve PO               (Requires 01-04 to be successfully run)
    KFSI5460-01-06 - Print PO                 (Requires 01-05 to be successfully run)
    KFSI5460-01-07 - Create Payment Request   (Requires 01-06 to be successfully run)
    KFSI5460-01-08 - Approve Payment Request  (Requires 01-07 to be successfully run)
    KFSI5460-01-09 - Recieve Item             (Requires 01-08 to be successfully run)

    KFSI5460-02:  Receiving preq job approves receiving node on 3x preqs with
                  correct tax amounts
    KFSI5460-02-01 - Create Requisition
    KFSI5460-02-02 - Approve Requisition      (Requires 02-01 to be successfully run)
    KFSI5460-02-03 - Assigns Contract Manager (Requires 02-02 to be successfully run)
    KFSI5460-02-04 - Create PO                (Requires 02-03 to be successfully run)
    KFSI5460-02-05 - Approve PO               (Requires 02-04 to be successfully run)
    KFSI5460-02-06 - Print PO                 (Requires 02-05 to be successfully run)
    KFSI5460-02-07 - Create Payment Request 1 (Requires 02-06 to be successfully run)
    KFSI5460-02-08 - Approve Payment Request  (Requires 02-07 to be successfully run)
    KFSI5460-02-09 - Create Payment Request 2 (Requires 02-08 to be successfully run)
    KFSI5460-02-10 - Approve Payment Request  (Requires 02-09 to be successfully run)
    KFSI5460-02-11 - Create Payment Request 3 (Requires 02-10 to be successfully run)
    KFSI5460-02-12 - Approve Payment Request  (Requires 02-11 to be successfully run)
    KFSI5460-02-13 - Recieve Item             (Requires 02-08 02-10, 02-12 to be successfully run)

    *** Failures:
        KFSI-5460-01-08 (approve button does not show for test user)
        KFSI-5460-01-09 (status not FINAL because of no approval)

        KFSI-5460-01-08 (approve button does not show for test user)
        KFSI-5460-02-10 (approve button does not show for test user)
        KFSI-5460-02-12 (approve button does not show for test user)
        KFSI-5460-02-13 (status not FINAL because of no approval)

    Currently, these tests do not verify values are correct, only that the
      documents will generate and can be approved and set to a Status of FINAL.
  Background:
    Given I am up top

  @Day1 @KFSI-5460-01 @KFSI-5460-01-01
  Scenario: Create Requisition

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec1"

  When I click the "Requisition" link
    And I click the "Collapse All" button

  When I click "Show" on the "Document Overview" tab
    And I set the "Description" to "testing: KFSI-5460"
    And I am in the "Requisition Detail" section
    And I check the "Receiving Required" checkbox
    And I click "Hide" on the "Document Overview" tab

  When I click "Show" on the "Delivery" tab
    And I am in the "Final Delivery" section
    And I start a lookup for "Building"
    And I set "Building Code" to "10" on the search page
    And I click the "Search" button
    And I "return" the first record on the search page
    And I start a lookup for "Room"
    And I set "Building Room Number" to "0001" on the search page
    And I click the "Search" button
    And I "return" the first record on the search page
    And I click "Hide" on the "Delivery" tab

  When I click "Show" on the "Vendor" tab
    And I am in the "Vendor Address" section
    And I start a lookup for "Suggested Vendor"
    And I set "Vendor Name" to "Micron" on the search page
    And I click the "Search" button
    And I "return" the first record on the search page
    And I click "Hide" on the "Vendor" tab

  When I click "Show" on the "Items" tab
    And I am in the "Add Item" section
    And I add to the "Add Item" table with:
      | Item Type        | Quantity | Unit Of Measure Code | Description       | Unit Cost | Action |
      | QUANTITY TAXABLE | 1        | EA                   | A 5460 widget     | 1000      | Add    |
    And I am in the "Current Items" section
    And I fill out the "Accounting Lines" table with:
      | Item # | Chart | Account Number | Object | Percent | Action |
      | Item 1 | UA    | 1080000        | 5230   | 100     | Add    |
    And I click "Hide" on the "Items" tab

  When I click "Show" on the "Additional Institutional Info" tab
    And I am in the "Additional" section
    And I set "Requestor Email" to "kfsi-5460@email.arizona.edu"
    And I click the "Calculate" button
    And I click the "Submit" button

  When I should see the message "Document was successfully submitted."
    And I record this "Document" number in the document header
    And I record this "requisition" number in the document header
    And I click the "Close" button
    And I close all extra browser windows

  @Day1 @KFSI-5460-01 @KFSI-5460-01-02
  Scenario: Requisition Approval

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sys10"

  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page

  When a new browser window appears
    And I click the "approve" button

  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page

  When a new browser window appears
    And I should see "Status" text set to "FINAL" in the document header
    And I should see "Requisition Status" text set to "Awaiting Contract Manager Assignment" in the document header
    And I close all extra browser windows

  @Day1 @KFSI-5460-01 @KFSI-5460-01-03
  Scenario: Assigns a contract manager

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec40"

  When I click the "Contract Manager Assignment" link
    And I am in the "Document Overview" tab
    And I should see "Description" set to "Contract Manager Assigned"

  When I am in the "Assign A Contract Manager" tab
    And I should see a table row with a Requisition Number of "the recorded requisition number"
  When I start a lookup for "Contract Manager"
    And I set "Contract Manager Code" to "13" on the search page
    And I click the "Search" button
    And I return the record with "Contract Manager Code" of "13" on the search page
  When I click the "Submit" button
    And I should see the message "Document was successfully submitted."
    And I click the "Reload" button

  When I click "Show" on the "Route Log" tab
    And I should see "Status" text set to "FINAL"
    And I close all extra browser windows

  @Day1 @KFSI-5460-01 @KFSI-5460-01-04
  Scenario: Create PO

  Given I am on the "Main Menu" system tab
    And I am backdoored as "kfs-test-sec40"

  When I click the "Purchase Orders" link
    And I set "Type" to "PO" on the search page
    And I set "Contract Manager" to "13" on the search page
    And I set "Requisition #" to "the recorded requisition number" on the search page
    And I click the "Search" button
    And I select the first document on the search page
  When a new browser window appears
    And I click the "Collapse All" button

  When I click "Show" on the "Delivery" tab
    And I am in the "Receiving Address" section
    And I start a lookup for "Receiving Address"
    And I click the "clear" button
    And I click the "search" button
    And I return the record with "Receiving Name" of "Main Campus" on the search page
    And I am in the "Address To Vendor" section
    And I should see "Shipping Address Presented to Vendor (use Receiving Address?)" radio button set to "Final Delivery Address"
    And I click "Hide" on the "Delivery" tab

  When I click "Show" on the "Vendor" tab
    And I am in the "Vendor Info" section
    And I set "Vendor Choice" to "Other"
    And I click "Hide" on the "Vendor" tab

  When I click "Show" on the "Stipulations" tab
    And I am in the "Vendor Stipulations and Information" section
    And I start a lookup for "Note Text"
    And I set "Vendor Stipulation Name" to "085" on the search page
    And I click the "Search" button
    And I return the record with "Vendor Stipulation Name" of "085" on the search page
    And I click the "Add" button
    And I set "Note Text" to "Rush Order"
    And I click the "Add" button
    And I click "Hide" on the "Stipulations" tab

  When I click "Show" on the "Notes and Attachments" tab
    And I set "Note Text" to "KFSI5460-03"
    And I click the "Add" on "Notes and Attachments"
    And I click "Hide" on the "Notes and Attachments" tab

  When I click "Show" on the "Ad Hoc Recipients" tab
    And I set "Action Requested" to "FYI" in the "Person Requests" subsection
    And I set "Principal Name" to "kfs-test-sec9"
    And I click the "Add" button in the "Person Requests" subsection
    And I click "Hide" on the "Ad Hoc Recipients" tab

  When I click the "calculate" button
    And I click the "Submit" button
    And I should see the message "Document was successfully submitted."
    And I record this "Purchase Order Document" number in the document header
    And I click the "Close" button
    And I close all extra browser windows

  @Day1 @KFSI-5460-01 @KFSI-5460-01-05
  Scenario: PO Approval

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec52"

  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded purchase order document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded purchase order document number" on the search page

  When a new browser window appears
    And I click the "approve" button

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec40"

  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded purchase order document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded purchase order document number" on the search page

  When a new browser window appears
    And I should see "Status" text set to "FINAL" in the document header
    And I close all extra browser windows

  @Day1 @KFSI-5460-01 @KFSI-5460-01-06
  Scenario: Print PO

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec40"

  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded purchase order document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded purchase order document number" on the search page

  When a new browser window appears
    And I click the "Print" button
    And a new browser window appears
    And I slow down by a lot

  When I switch to the 2nd browser window
    And I am fast
    And I record this "Purchase Order" number in the document header
    And I close all extra browser windows

  @Day1 @KFSI-5460-01 @KFSI-5460-01-07
  Scenario: Create Payment Request using ACH/Check

  Given I am on the "Central Admin" system tab
    And I am logged in as "kfs-test-sec36"

  When I click the "Payment Request" link
    And I am in the "Payment Request Initiation" tab
    And I set "Purchase Order #" to "the recorded purchase order number"
    And I set "Invoice Number" to "PREQ<todays date>"
    And I set "Invoice Date" to "Today's Date"
    And I set "Vendor Invoice Amount" to "1000"
    And I click the "continue" button
    And I click the "Collapse All" button

  When I click "Show" on the "Invoice Info" tab
    And I check the "Immediate Pay" checkbox
    And I click "Hide" on the "Invoice Info" tab

  When I click "Show" on the "Process Items" tab
    And I am in the "Items" section
    And I fill out the "Items" table with:
      | Item # | Quantity Invoiced |
      | 1      | 1                 |
    And I click "Hide" on the "Process Items" tab

  When I click the "calculate" button
    And I click the "save" button
    And I should see the message "Document was successfully saved."
    And I record this "document" number in the document header
    And I record this "payment request" number in the document header
    And I record this "payment request document" number in the document header
    And I click the "Submit" button
    And I close all extra browser windows

  @Day1 @KFSI-5460-01 @KFSI-5460-01-08
  Scenario: Payment Request Approval

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-sys-user"

  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page

  When a new browser window appears
    And I click the "approve" button

  Given I am on the "Main Menu" system tab
    And I am logged in as "csmith11"

  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page

  When a new browser window appears
    And I click the "approve" button

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec52"

  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page

  When a new browser window appears
    And I click the "Collapse All" button

  When I click "Show" on the "Tax Information" tab
    And I am in the "Tax Area Edits" section
    And I set "Income Class" to "I - Independent Contractor"
    And I set "Federal Tax Percent" to "0"
    And I set "State Tax Percent" to "0"
    And I set "Country" to "UNITED STATES"
    And I click "Hide" on the "Tax Information" tab

  When I click the "calculate" button
    And I click the "approve" button

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec36"

  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page

  When a new browser window appears
    And I should see "Status" text set to "FINAL" in the document header
    And I close all extra browser windows

  @Day1 @KFSI-5460-01 @KFSI-5460-01-09
  Scenario: Recieve Item

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec36"
    And I click the "Receiving" link under the "Transactions" heading

  When I am in the "Line Item Receiving Initiation" tab
    And I set the "Purchase Order #" to "the recorded purchase order number"
    And I set "Vendor Date" to "Today's Date"
    And I click the "continue" button
    And I click the "Collapse All" button

  When I click "Show" on the "Items" tab
    And I am in the "Receiving Line Items" section
    And I fill out the "Receiving Line Items" table with:
      | # | Item Received Total Quantity |
      | 1 | 1                            |
    And I click "Hide" on the "Items" tab

   When I click the "save" button
    And I should see the message "Document was successfully saved."
    And I click the "Submit" button
    And I should see the message "Document was successfully submitted."
    And I click the "Reload" button
    And I should see the message "Document was successfully reloaded."
    And I should see "Status" text set to "FINAL" in the document header


  @Day1 @KFSI-5460-02 @KFSI-5460-02-01
  Scenario: Create Requisition

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec1"

  When I click the "Requisition" link
    And I click the "Collapse All" button

  When I click "Show" on the "Document Overview" tab
    And I set the "Description" to "testing: KFSI-5460"
    And I am in the "Requisition Detail" section
    And I check the "Receiving Required" checkbox
    And I click "Hide" on the "Document Overview" tab

  When I click "Show" on the "Delivery" tab
    And I am in the "Final Delivery" section
    And I start a lookup for "Building"
    And I set "Building Code" to "10" on the search page
    And I click the "Search" button
    And I "return" the first record on the search page
    And I start a lookup for "Room"
    And I set "Building Room Number" to "0001" on the search page
    And I click the "Search" button
    And I "return" the first record on the search page
    And I click "Hide" on the "Delivery" tab

  When I click "Show" on the "Vendor" tab
    And I am in the "Vendor Address" section
    And I start a lookup for "Suggested Vendor"
    And I set "Vendor Name" to "Micron" on the search page
    And I click the "Search" button
    And I "return" the first record on the search page
    And I click "Hide" on the "Vendor" tab

  When I click "Show" on the "Items" tab
    And I am in the "Add Item" section
    And I add to the "Add Item" table with:
      | Item Type        | Quantity | Unit Of Measure Code | Description       | Unit Cost | Action |
      | QUANTITY TAXABLE | 3        | EA                   | 5460 widgets      | 1000      | Add    |
    And I am in the "Current Items" section
    And I fill out the "Accounting Lines" table with:
      | Item # | Chart | Account Number | Object | Percent | Action |
      | Item 1 | UA    | 1080000        | 5230   | 100     | Add    |
    And I click "Hide" on the "Items" tab

  When I click "Show" on the "Additional Institutional Info" tab
    And I am in the "Additional" section
    And I set "Requestor Email" to "kfsi-5460@email.arizona.edu"
    And I click the "Calculate" button
    And I click the "Submit" button

  When I should see the message "Document was successfully submitted."
    And I record this "Document" number in the document header
    And I record this "requisition" number in the document header
    And I click the "Close" button
    And I close all extra browser windows

  @Day1 @KFSI-5460-02 @KFSI-5460-02-02
  Scenario: Requisition Approval

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sys10"

  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page

  When a new browser window appears
    And I click the "approve" button

  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page

  When a new browser window appears
    And I should see "Status" text set to "FINAL" in the document header
    And I should see "Requisition Status" text set to "Awaiting Contract Manager Assignment" in the document header
    And I close all extra browser windows

  @Day1 @KFSI-5460-02 @KFSI-5460-02-03
  Scenario: Assigns a contract manager

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec40"

  When I click the "Contract Manager Assignment" link
    And I am in the "Document Overview" tab
    And I should see "Description" set to "Contract Manager Assigned"

  When I am in the "Assign A Contract Manager" tab
    And I should see a table row with a Requisition Number of "the recorded requisition number"

  When I start a lookup for "Contract Manager"
    And I set "Contract Manager Code" to "13" on the search page
    And I click the "Search" button
    And I return the record with "Contract Manager Code" of "13" on the search page

  When I click the "Submit" button
    And I should see the message "Document was successfully submitted."
    And I click the "Reload" button

  When I click "Show" on the "Route Log" tab
    And I should see "Status" text set to "FINAL"
    And I close all extra browser windows

  @Day1 @KFSI-5460-02 @KFSI-5460-02-04
  Scenario: Create PO

  Given I am on the "Main Menu" system tab
    And I am backdoored as "kfs-test-sec40"

  When I click the "Purchase Orders" link
    And I set "Type" to "PO" on the search page
    And I set "Contract Manager" to "13" on the search page
    And I set "Requisition #" to "the recorded requisition number" on the search page
    And I click the "Search" button
    And I select the first document on the search page

  When a new browser window appears
    And I click the "Collapse All" button

  When I click "Show" on the "Delivery" tab
    And I am in the "Receiving Address" section
    And I start a lookup for "Receiving Address"
    And I click the "clear" button
    And I click the "search" button
    And I return the record with "Receiving Name" of "Main Campus" on the search page
    And I am in the "Address To Vendor" section
    And I should see "Shipping Address Presented to Vendor (use Receiving Address?)" radio button set to "Final Delivery Address"
    And I click "Hide" on the "Delivery" tab

  When I click "Show" on the "Vendor" tab
    And I am in the "Vendor Info" section
    And I set "Vendor Choice" to "Other"
    And I click "Hide" on the "Vendor" tab

  When I click "Show" on the "Stipulations" tab
    And I am in the "Vendor Stipulations and Information" section
    And I start a lookup for "Note Text"
    And I set "Vendor Stipulation Name" to "085" on the search page
    And I click the "Search" button
    And I return the record with "Vendor Stipulation Name" of "085" on the search page
    And I click the "Add" button
    And I set "Note Text" to "Rush Order"
    And I click the "Add" button
    And I click "Hide" on the "Stipulations" tab

  When I click "Show" on the "Notes and Attachments" tab
    And I set "Note Text" to "KFSI5460-03"
    And I click the "Add" on "Notes and Attachments"
    And I click "Hide" on the "Notes and Attachments" tab

  When I click "Show" on the "Ad Hoc Recipients" tab
    And I set "Action Requested" to "FYI" in the "Person Requests" subsection
    And I set "Principal Name" to "kfs-test-sec9"
    And I click the "Add" button in the "Person Requests" subsection
    And I click "Hide" on the "Ad Hoc Recipients" tab

  When I click the "calculate" button
    And I click the "Submit" button
    And I should see the message "Document was successfully submitted."
    And I record this "Purchase Order Document" number in the document header
    And I click the "Close" button
    And I close all extra browser windows

  @Day1 @KFSI-5460-02 @KFSI-5460-02-05
  Scenario: PO Approval

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec52"

  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded purchase order document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded purchase order document number" on the search page

  When a new browser window appears
    And I click the "approve" button

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec40"

  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded purchase order document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded purchase order document number" on the search page

  When a new browser window appears
    And I should see "Status" text set to "FINAL" in the document header
    And I close all extra browser windows

  @Day1 @KFSI-5460-02 @KFSI-5460-02-06
  Scenario: Print PO

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec40"

  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded purchase order document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded purchase order document number" on the search page

  When a new browser window appears
    And I click the "Print" button
    And a new browser window appears
    And I slow down by a lot

  When I switch to the 2nd browser window
    And I am fast
    And I record this "Purchase Order" number in the document header
    And I close all extra browser windows

  @Day1 @KFSI-5460-02 @KFSI-5460-02-07
  Scenario: Create Payment Request 1

  Given I am on the "Central Admin" system tab
    And I am logged in as "kfs-test-sec36"

  When I click the "Payment Request" link
    And I am in the "Payment Request Initiation" tab
    And I set "Purchase Order #" to "the recorded purchase order number"
    And I set "Invoice Number" to "PREQ<todays date>"
    And I set "Invoice Date" to "Today's Date"
    And I set "Vendor Invoice Amount" to "1000"
    And I click the "continue" button
    And I click the "Collapse All" button

  When I click "Show" on the "Invoice Info" tab
    And I check the "Immediate Pay" checkbox
    And I click "Hide" on the "Invoice Info" tab

  When I click "Show" on the "Process Items" tab
    And I am in the "Items" section
    And I fill out the "Items" table with:
      | Item # | Quantity Invoiced |
      | 1      | 1                 |
    And I click "Hide" on the "Process Items" tab

  When I click the "calculate" button
    And I click the "save" button
    And I should see the message "Document was successfully saved."
    And I record this "document" number in the document header
    And I record this "payment request" number in the document header
    And I record this "payment request document" number in the document header
    And I click the "Submit" button
    And I close all extra browser windows


  @Day1 @KFSI-5460-02 @KFSI-5460-02-08
  Scenario: Payment Request Approval 1

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-sys-user"

  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page

  When a new browser window appears
    And I click the "approve" button

  Given I am on the "Main Menu" system tab
    And I am logged in as "csmith11"

  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page

  When a new browser window appears
    And I click the "approve" button

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec52"

  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page

  When a new browser window appears
    And I click the "Collapse All" button

  When I click "Show" on the "Tax Information" tab
    And I am in the "Tax Area Edits" section
    And I set "Income Class" to "I - Independent Contractor"
    And I set "Federal Tax Percent" to "0"
    And I set "State Tax Percent" to "0"
    And I set "Country" to "UNITED STATES"
    And I click "Hide" on the "Tax Information" tab

  When I click the "calculate" button
    And I click the "approve" button

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec36"

  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page

  When a new browser window appears
    And I should see "Status" text set to "FINAL" in the document header
   When I close all extra browser windows


  @Day1 @KFSI-5460-02 @KFSI-5460-02-09
  Scenario: Create Payment Request 2

  Given I am on the "Central Admin" system tab
    And I am logged in as "kfs-test-sec36"

  When I click the "Payment Request" link
    And I am in the "Payment Request Initiation" tab
    And I set "Purchase Order #" to "the recorded purchase order number"
    And I set "Invoice Number" to "PREQ<todays date>"
    And I set "Invoice Date" to "Today's Date"
    And I set "Vendor Invoice Amount" to "1000"
    And I click the "continue" button
    #The yes button needs to be clicked on "Warning: A payment request on the
    #  specified PO already exists for the requested date and amount. Do you
    #  want to continue? <yes> <no>
    And I click the "Yes" button
    And I click the "Collapse All" button

  When I click "Show" on the "Invoice Info" tab
    And I check the "Immediate Pay" checkbox
    And I click "Hide" on the "Invoice Info" tab

  When I click "Show" on the "Process Items" tab
    And I am in the "Items" section
    And I fill out the "Items" table with:
      | Item # | Quantity Invoiced |
      | 1      | 1                 |
    And I click "Hide" on the "Process Items" tab

  When I click the "calculate" button
    And I click the "save" button
    And I should see the message "Document was successfully saved."
    And I record this "document" number in the document header
    And I record this "payment request" number in the document header
    And I record this "payment request document" number in the document header
    And I click the "Submit" button
    And I close all extra browser windows


  @Day1 @KFSI-5460-02 @KFSI-5460-02-10
  Scenario: Payment Request Approval 2

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-sys-user"

  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page

  When a new browser window appears
    And I click the "approve" button

  Given I am on the "Main Menu" system tab
    And I am logged in as "csmith11"

  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page

  When a new browser window appears
    And I click the "approve" button

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec52"

  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page

  When a new browser window appears
    And I click the "Collapse All" button

  When I click "Show" on the "Tax Information" tab
    And I am in the "Tax Area Edits" section
    And I set "Income Class" to "I - Independent Contractor"
    And I set "Federal Tax Percent" to "0"
    And I set "State Tax Percent" to "0"
    And I set "Country" to "UNITED STATES"
    And I click "Hide" on the "Tax Information" tab

  When I click the "calculate" button
    And I click the "approve" button

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec36"

  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page

  When a new browser window appears
    And I should see "Status" text set to "FINAL" in the document header
   When I close all extra browser windows


  @Day1 @KFSI-5460-02 @KFSI-5460-02-11
  Scenario: Create Payment Request 3

  Given I am on the "Central Admin" system tab
    And I am logged in as "kfs-test-sec36"

  When I click the "Payment Request" link
    And I am in the "Payment Request Initiation" tab
    And I set "Purchase Order #" to "the recorded purchase order number"
    And I set "Invoice Number" to "PREQ<todays date>"
    And I set "Invoice Date" to "Today's Date"
    And I set "Vendor Invoice Amount" to "1000"
    And I click the "continue" button
    #The yes button needs to be clicked on "Warning: A payment request on the
    #  specified PO already exists for the requested date and amount. Do you
    #  want to continue? <yes> <no>
    And I click the "Yes" button
    And I click the "Collapse All" button

  When I click "Show" on the "Invoice Info" tab
    And I check the "Immediate Pay" checkbox
    And I click "Hide" on the "Invoice Info" tab

  When I click "Show" on the "Process Items" tab
    And I am in the "Items" section
    And I fill out the "Items" table with:
      | Item # | Quantity Invoiced |
      | 1      | 1                 |
    And I click "Hide" on the "Process Items" tab

  When I click the "calculate" button
    And I click the "save" button
    And I should see the message "Document was successfully saved."
    And I record this "document" number in the document header
    And I record this "payment request" number in the document header
    And I record this "payment request document" number in the document header
    And I click the "Submit" button
    And I close all extra browser windows


  @Day1 @KFSI-5460-02 @KFSI-5460-02-12
  Scenario: Payment Request Approval 3

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-sys-user"

  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page

  When a new browser window appears
    And I click the "approve" button

  Given I am on the "Main Menu" system tab
    And I am logged in as "csmith11"

  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page

  When a new browser window appears
    And I click the "approve" button

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec52"

  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page

  When a new browser window appears
    And I click the "Collapse All" button

  When I click "Show" on the "Tax Information" tab
    And I am in the "Tax Area Edits" section
    And I set "Income Class" to "I - Independent Contractor"
    And I set "Federal Tax Percent" to "0"
    And I set "State Tax Percent" to "0"
    And I set "Country" to "UNITED STATES"
    And I click "Hide" on the "Tax Information" tab

  When I click the "calculate" button
    And I click the "approve" button

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec36"

  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page

  When a new browser window appears
    And I should see "Status" text set to "FINAL" in the document header
    And I close all extra browser windows


  @Day1 @KFSI-5460-02 @KFSI-5460-02-13
  Scenario: Recieve Item

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec36"
    And I click the "Receiving" link under the "Transactions" heading

  When I am in the "Line Item Receiving Initiation" tab
    And I set the "Purchase Order #" to "the recorded purchase order number"
    And I set "Vendor Date" to "Today's Date"
    And I click the "continue" button
    And I click the "Collapse All" button

  When I click "Show" on the "Items" tab
    And I am in the "Receiving Line Items" section
    And I fill out the "Receiving Line Items" table with:
      | # | Item Received Total Quantity |
      | 1 | 3                            |
    And I click "Hide" on the "Items" tab

   When I click the "save" button
    And I should see the message "Document was successfully saved."
    And I click the "Submit" button
    And I should see the message "Document was successfully submitted."
    And I click the "Reload" button
    And I should see the message "Document was successfully reloaded."
    And I should see "Status" text set to "FINAL" in the document header


