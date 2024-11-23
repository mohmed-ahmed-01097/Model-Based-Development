% Title: Introduction to MATLAB Basics for Beginners
%% Objective: 
% In this practical lab, beginners will learn and practice fundamental MATLAB concepts, 
% including cell arrays, structures, character data, conditional statements (if), for loops, and basic plotting.

%% Prerequisites:
% MATLAB installed on your computer.
% Basic understanding of MATLAB's user interface.
clear;
clc;

% Lab Tasks:
%% 1. Cell Arrays:
% Create a cell array containing various data types (numbers, text, and variables).
var1 = true;
var2.field = "String";
cellVar = {3.14, linspace(1,10,5), 'char array', var1, var2};

% Access and display specific elements within the cell array.
disp(cellVar{2});

%% 2. Structures:
% Create a simple structure to store information about a person (name, age, city).
Person = struct('name', 'someone', 'age', 27, 'city', 'Egypt');

% Access and display the structure fields.
disp(Person);

%% 3. Character Data:
% Create a character array with your name.
firstName = 'Mohamed';
lastName = 'Ahmed';

% Concatenate your name with another character array.
totalName = strcat(firstName, ' ', lastName);

% Display the results.
disp(totalName);

%% 4. Conditional Statements (If):
% Write an if statement that checks if a number is even or odd.
num = 5;
if mod(num, 2)
    isOdd = true;
else
    isOdd = false;
end

% Display a message based on the result of the if statement.
if isOdd
    disp([num2str(num) ' is a Odd Number']);
else
    disp([num2str(num) ' is an Even Number']);
end

%% 5. For Loops:
% Create a for loop to generate a sequence of numbers (e.g., 1 to 10).
for i = 1:10
    % Display the numbers within the loop.
    fprintf(' %d',i);
end
fprintf('\n');

%% 6. Basic Plotting:
% Generate data for a simple plot (e.g., a sine wave).
x = linspace(-pi, pi, 100);
y = sin(x);

% Plot the data with proper labels and a legend.
plot(x, y);
xlabel('Degree');
legend('Sin Wave', 'Location','southeast');
title('sine wave graph');
grid on;

%% Lab Instructions:
% Open MATLAB on your computer.
% Perform each task listed above by writing MATLAB code in the Script.
% Verify the results and understand how each concept works.
% Experiment with different values and variations of the tasks.

%% Tips:
% Feel free to use MATLAB's built-in help feature (help) if you encounter any issues.
% Practice is key. Try different examples and scenarios to deepen your understanding.
% By the end of this practical lab, beginners should have a solid grasp of these fundamental MATLAB concepts and be ready to explore more advanced topics.
