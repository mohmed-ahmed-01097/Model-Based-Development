% Lab 1 %
%% Objective: 
% This lab exercise will help you practice essential MATLAB concepts, including
% creating and manipulating numeric arrays, performing matrix concatenation, and
% using the repmat function
clear;
clc;

%% Part 1: Creating Numeric Arrays %%
% Open MATLAB on your computer
% Create a 3x3 matrix named matrixA with the following values
% 3 2 1
% 6 5 4
% 9 8 7
matrixA = [3 2 1; 6 5 4; 9 8 7];

% Create a 3x3 matrix named matrixB with the following values
% 12 11 10
% 15 14 13
%18 17 16
matrixB = [12 11 10; 15 14 13; 18 17 16];

% Calculate the sum of matrixA and matrixB and store it in a variable called matrixSum
matrixSum = matrixA + matrixB;

% Display the contents of matrixSum
disp('matrixSum :');
disp(matrixSum);

%% Part 2: Matrix Concatenation
% Create a row vector named rowVector with values from 1 to 5
rowVector = 1:5;

% Create a column vector named columnVector with values from 6 to 10
columnVector = (6:10)';

% Concatenate rowVector and columnVector horizontally and store the result in a variable called horizontalConcat
horizontalConcat = horzcat(rowVector, columnVector');

% Display the contents of horizontalConcat
disp('horizontalConcat :');
disp(horizontalConcat);

%% Part 3: Using repmat Function
% Create a 2x2 matrix named originalMatrix with any values you like
originalMatrix = randi(100, 2, 2);

% Use the repmat function to replicate originalMatrix into a 4x4 pattern and store it in a variable called repeatedMatrix
repeatedMatrix = repmat(originalMatrix, 2);

% Display the contents of repeatedMatrix
disp('originalMatrix :');
disp(originalMatrix);
disp('repeatedMatrix :');
disp(repeatedMatrix);

%% Part 4: Challenge
% Challenge yourself by performing : the following tasks
% Create a 3x3 identity matrix (a matrix with diagonal elements as 1 and others as 0) and store
% it in a variable called identityMatrix
identityMatrix = eye(3);

% or using this
% identityMatrix = zeros(3,3);
% for i = 1:length(identityMatrix)
%     identityMatrix(i,i) = 1;
% end

% Perform matrix multiplication between identityMatrix and matrixA. Store the result in a variable called matrixProduct
matrixProduct = identityMatrix * matrixA;

% Display the contents of matrixProduct
disp('matrixProduct :');
disp(matrixProduct);

%% Conclusion: 
% This lab exercise covers fundamental MATLAB concepts, such as creating and
% manipulating numeric arrays, performing matrix concatenation, and using the repmat
% function. It also includes a challenge to test your understanding of matrix multiplication.
% Practice these skills to become more proficient in MATLAB