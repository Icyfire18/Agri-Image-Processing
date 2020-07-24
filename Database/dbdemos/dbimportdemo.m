function dbimportdemo()
%DBIMPORTDEMO Imports data into MATLAB from a database.

%   Version 1.0  21-Oct-1997
%   Author(s): E.F. McGoldrick, 12/5/1997
%   Copyright 1984-2002 The MathWorks, Inc.

% Connect to a database.

connA=database('SampleDB','','')

% Check the database status.

connA.DatabaseProductName
connA.DatabaseProductVersion
connA.DriverName
connA.DriverVersion
connA.MaxDatabaseConnections
connA.UserName
connA.AutoCommit


% Open cursor and execute SQL statement.

cursorA=exec(connA,'select country from customers');

% Fetch the first 10 rows of data.

cursorA=fetch(cursorA,10)

% Display the data.

AA=cursorA.Data

% Close the cursor and the connection.

close(cursorA)
close(connA)
