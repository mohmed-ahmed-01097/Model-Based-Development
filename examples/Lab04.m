% Title: Understanding MATLAB Function Concepts
%% Objective:
% In this lab, you will learn and practice fundamental concepts related to MATLAB functions. You will create your own functions, understand function inputs and outputs, and explore common function features.

%% Prerequisites:
% Basic knowledge of MATLAB.
% MATLAB installed on your computer.
clear;
clc;

% Lab Tasks:
%% Task 1: Creating a Simple Function
% Create a new function in MATLAB called mySimpleFunction.
% This function should take two input arguments (numbers) and return their sum
mySimpleFunction = @(x,y) x + y;
% Call this function with sample inputs and display the result.
disp(['The sum of 3 and 7 is: ' num2str(mySimpleFunction(3, 7))]);

%% Task 2: Function Inputs and Outputs
% Create a function named calculateCircleArea that takes the radius of a circle as input and returns the area of the circle.
calculateCircleArea = @(x) pi * x^2;
% Call the function with different radii and display the results.
radius = 5;
disp(['The area of a circle with radius ' num2str(radius) ' is: ' num2str(calculateCircleArea(radius))]);

%% Task 3: Function with Multiple Outputs
% Create a function named computeStatistics that takes a vector of numbers as input.
% This function should return both the mean and the standard deviation of the input vector.
computeStatistics = @(vec) [mean(vec), std(vec)];
% Call the function with sample data and display the results.
data = [4, 8, 15, 16, 23, 42];
statistics = computeStatistics(data);

% Extract the mean and standard deviation
meanVal = statistics(1);
stdVal = statistics(2);
disp(['The mean is: ' num2str(meanVal) ', and the standard deviation is: ' num2str(stdVal)]);

%% Task 4: Nested Functions
% Create a main function called outerFunction.
% Inside outerFunction, define another function called innerFunction.
% innerFunction should take two inputs, add them, and return the result.
innerFunction = @(x, y) x + y;
outerFunction = @(x, y) innerFunction(x, y);
% Call innerFunction from outerFunction and display the result.
outerResult = outerFunction(12, 8);
disp(['The result from the nested function is: ' num2str(outerResult)]);

%% Task 5: Function Handles
% Create a function named applyFunction that takes a function handle and a vector as inputs.
% The function should apply the provided function to every element in the vector and return the result.
applyFunction = @(handler, vec) arrayfun(handler, vec);

% Test this function with various function handles, like square, cube, etc.
vec = [1, 2, 3, 4, 5];
squaredVec = applyFunction(@(x) x.^2, vec);
disp('The squared values of the vector are:');
disp(squaredVec);

%% Task 6: Anonymous Functions
% Create an anonymous function that calculates the area of a triangle. The function should take base and height as inputs.
triangleArea = @(base, height) 0.5 * base * height;

% Call the anonymous function with different base and height values to calculate triangle areas.
base = 10; height = 5; % Example dimensions
area = triangleArea(base, height);
disp(['The area of a triangle with base ' num2str(base) ' and height ' num2str(height) ' is: ' num2str(area)]);

%% Task 7: Using Built-in Functions
% Use MATLAB's built-in functions like max, min, and sum in a script.
% Create a vector of numbers and apply these functions to it.
vec = [4, 8, 15, 16, 23, 42];
disp(['The maximum value is: ' num2str(max(vec))]);
disp(['The minimum value is: ' num2str(min(vec))]);
disp(['The sum of all elements is: ' num2str(sum(vec))]);

%% Submission:
% Prepare a MATLAB script that includes your solutions to the tasks above. 
% Save the script as a .m file and submit it. 
% Be sure to include comments to explain your code.

