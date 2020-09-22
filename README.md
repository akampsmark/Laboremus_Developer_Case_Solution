## Akampurira Rugumambaju Mark Laboremus Developer Case 

This repository contains an asynchronous flow to csv file processing for a developer case study by laboremus Uganda.

## REQUIREMENTS TO RUN THE APLICATION
    1. Visual Studio 2017 and above
    2. SQL Server Studio V14.02 and above
    3. NetFramework 4.5 and above
    4. Web Browser(Preferably Chrome)
    5. Windows 10

## HOW TO RUN THE SYSTEM
    The system has two components
        1. UserPortal -- Contains the User interface
        2. ProcessorService -- Background service that processes uploaded files
        3. Database Script
## STEPS
## RESTORE THE DATABASE
    1. Open the sql script file in Part_1 folder of the repository in Sql server.
    2. Update locations where to save the .mdf and .ldf files of the database specific to the server
    3. Click Run in SQL server to have the database and objects created.
## USER PORTAL
    1. Open the UserPortal Solution in Visual studio.
    2. Go to WebConfig of the "Portal" project and change the connectionstring appropriately. i.e
            -- datasource
            -- databasename
            -- sql server username
            -- sql server password
    3. Click run to open the UI in a broswer.

## WINDOWS SERVICE
    1. Open the Processor Service Solution in Visual studio.
    2. Go to AppConfig of the "CaseMSQProcessorService" project and change the connectionstring appropriately. i.e
            -- datasource
            -- databasename
            -- sql server username
            -- sql server password
    3. Click run to open a console and process files.

## SUMMARY OF SYSTEM FLOW
## SYSTEM COMPONENT (USER INTERFACE)
## USE CASE 1: UPLOAD A FILE
    1. User loads the default UI page
    2. A file is selected and Uploaded by the user.
    3. The file is validated on filetype and number of rows
    4. The file is then saved to a location on the server.
    5. File location is then inserted in a database table pending processing and user is given a success message.
(All Errors as a result of the upload process are logged and displayed to the user)

## USE CASE 2: VIEW TOP 5 PROFITABLE PRODUCTS AND TOTAL PROFIT IN A DATE RANGE
    1. User clicks on "Summary Dashboard" to load the page
    2. User selects a Start and End Date using the input calender
    3. The user submits and the system displays the report data

## USE CASE 3: VIEW DATA TABLE OF ORDERS
    1. The user clicks on menu item "Sales Report"
    2. The user optionally selects Start and End Date from which the report is to be extracted.
    3. The user submits and order report is generated.

## SYSTEM COMPONENT (WINDOWS SERVICE)
## USE CASE 1: PROCESS UPLOADED FILE
    1. The services infinitely checks the table for files whose Processed state is pending.
            For each of these files:
            -- The file is read for its contents
                For each row of the file:
                    -- Each column is validated
                    -- Valid rows are inserted into an in-memory table
                    -- Invalid rows are inserted into an in-memory table
            -- Both the valid and invalid in memory tables are bulk inserted into Sales and Error tables respectively.