% Task 1 %
%% Objective: 
% In this task, you will create a MATLAB program that covers various aspects of
% MATLAB numeric types, creating numeric arrays, using specialized matrix functions, and
% matrix concatenation.
clear;
clc;

%% Task Description:
% You are required to write a MATLAB program that performs the following tasks:

%% Numeric Types:
% Define and initialize a variable intVar with an integer value of your choice.
intVar = int8(1.5);

% Define and initialize a variable doubleVar with a double-precision floating-point value.
doubleVar = 1.5; % Automatically treated as double.

% Display the data type of both intVar and doubleVar using the class function.
disp('Data type of intVar:');
disp(class(intVar));
disp('Data type of doubleVar:');
disp(class(doubleVar));

%% Creating Numeric Arrays:
% Create a row vector evenNumbers containing the first 5 even numbers (2, 4, 6, 8, 10).
evenNumbers = 2:2:10;

% Create a column vector primeNumbers containing the first 5 prime numbers (2, 3, 5, 7, 11).
primesArray = primes(100);
primeNumbers = primesArray(1:5);

% Display both evenNumbers and primeNumbers.
disp('evenNumbers :');
disp(evenNumbers);
disp('primeNumbers :');
disp(primeNumbers);

%% Specialized Matrix Functions:
% Create a 3x3 identity matrix identityMatrix using a specialized matrix function.
identityMatrix = eye(3);

% Create a 3x3 magic square magicSquare using another specialized matrix function.
magicSquare = ones(2,2);

% Display both identityMatrix and magicSquare.
disp('identityMatrix :');
disp(identityMatrix);
disp('magicSquare :');
disp(magicSquare);

%% Matrix Concatenation:
% Concatenate the evenNumbers vector horizontally with the primeNumbers vector to create a
% new row vector combinedVector.
combinedVector = horzcat(evenNumbers,primeNumbers);

% Display the combinedVector.
disp('combinedVector :');
disp(combinedVector);

% Create a new matrix combinedMatrix by vertically concatenating identityMatrix and magicSquare.
if length(identityMatrix) > length(magicSquare)
    MAX = length(identityMatrix);
    magicSquare(end+1:MAX,MAX)=0;
else
    MAX = length(magicSquare);
    identityMatrix(end+1:MAX,MAX)=0;
end
combinedMatrix = vertcat(identityMatrix, magicSquare);

% Display the combinedMatrix.
disp('combinedMatrix :');
disp(combinedMatrix);

%% Note:
% Ensure that your program is well-commented to explain each step.
% Test your code to verify its correctness.

%% Submission:
% Create a MATLAB script (.m file) that contains your code for the tasks described.
% Include comments to explain the purpose of each section of code.
% Test your script to ensure it functions correctly.
% Submit your MATLAB script for evaluation.
% This task will assess your understanding of MATLAB numeric types, array creation, the use
% of specialized matrix functions, and matrix concatenation. 
% Good luck