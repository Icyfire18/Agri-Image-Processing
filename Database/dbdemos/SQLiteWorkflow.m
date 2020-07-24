%% MATLAB Interface to SQLite Workflow example

% Copyright 2016 The MathWorks, Inc.

% The following workflow example shows how to:

% - Create a SQLite database file
% - Create SQL tables 
% - Insert records in SQL tables
% - Close the connection to SQLite database file
% - Open new connection in 'readonly' mode
% - Fetch records into MATLAB
% - Close the connection to SQLite database file

%% Create a SQLite database file

% Create a new SQLite database file using 'create' switch
conn = sqlite('tutorial.db','create');

%% Create SQL tables

% Create table inventoryTable
createInventoryTable = 'create table inventoryTable (productNumber NUMERIC, Quantity NUMERIC, Price NUMERIC, inventoryDate VARCHAR )';
exec(conn, createInventoryTable)

% Create table suppliers
createSuppliers = 'create table suppliers ( SupplierNumber NUMERIC, SupplierName varchar(50), City varchar(20), Country varchar(20), FaxNumber varchar(20) )';
exec(conn, createSuppliers)

% Create table salesVolume
createSalesVolume = 'create table salesVolume ( StockNumber NUMERIC, January NUMERIC, February NUMERIC, March NUMERIC, April NUMERIC, May NUMERIC, June NUMERIC, July NUMERIC, August NUMERIC, September NUMERIC, October NUMERIC, November NUMERIC, December NUMERIC )';
exec(conn, createSalesVolume)

% Create table productTable
createProductTable = 'create table productTable ( productNumber NUMERIC, stockNumber NUMERIC, supplierNumber NUMERIC, unitCost NUMERIC, productDescription varchar(20) )';
exec(conn, createProductTable)

% Clear workspace variables
clear createInventoryTable createSuppliers createSalesVolume createProductTable

%% Insert records in SQL tables

% Load MAT file: 'sqliteworkflowdata.mat' to insert records
load('sqliteworkflowdata.mat')

% Insert records to 'InventoryTable'
insert(conn, 'inventoryTable', {'productNumber', 'Quantity', 'Price', 'inventoryDate'}, CinvTable)

% Insert records to 'Suppliers'
insert(conn, 'suppliers' , {'SupplierNumber', 'SupplierName', 'City', 'Country', 'FaxNumber'}, Csuppliers)

% Insert records to 'SalesVolume'
insert(conn, 'salesVolume', {'StockNumber', 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'}, CsalesVol)

% Insert records to 'ProductTable'
insert(conn, 'productTable', {'productNumber', 'stockNumber', 'supplierNumber', 'unitCost', 'productDescription'}, CprodTable)

% Clear workspace variables
clear CinvTable Csuppliers CsalesVol CprodTable

%% Close the connection to SQLite database file
close(conn)

% Clear workspace variables
clear conn

%% Open new connection in 'readonly' mode

conn = sqlite('tutorial.db','readonly');

%% Fetch records into MATLAB

% Fetch records from inventoryTable
inventoryTable_data = fetch(conn, 'SELECT * FROM inventoryTable') %#ok<*NOPTS,*NASGU>

% Fetch records from Suppliers
suppliers_data = fetch(conn, 'SELECT * FROM suppliers')

% Fetch records from SalesVolume
salesVolume_data = fetch(conn, 'SELECT * FROM salesVolume')

% Fetch records from ProductTable
productTable_data = fetch(conn, 'SELECT * FROM productTable')

%% Close the connection to SQLite database file
close(conn)

% Clear workspace variables
clear conn