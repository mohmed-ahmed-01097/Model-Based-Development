% Lab Title: MATLAB Control Structures - While and Switch
%% Objective: 
% In this lab, you will practice working with MATLAB's control structures, specifically the while loop and the switch statement.

%% Prerequisites:
% Basic knowledge of MATLAB.
% MATLAB environment set up.
clear;
clc;

% Lab Tasks:
%% Task 1: While Loop
% Write a MATLAB script that uses a while loop to print even numbers from 2 to 20.
i = 2;
while i <= 20
    disp(i);
    i = i + 2;
end

% Create a script that calculates the factorial of a given number using a while loop. Prompt the user for input.
num = input("Enter a Number ");
originalNum = num; % Save the original value
fact = 1;
while num
    fact = fact * num;
    num = num - 1;
end
disp(['the Factorial of ' num2str(originalNum) ' is : ' num2str(fact)]);

%% Task 2: Switch Statement
% Write a MATLAB script to calculate the cost of a trip based on the mode of transportation. 
% Use a switch statement to handle different cases. 
% The modes are: car, train, bus, and airplane. Each mode has a different cost per mile.
model = 'car';
distance = 10; % in mile
switch model
    case 'car'
        cost = distance * 3;
    case 'train'
        cost = distance * 5;
    case 'bus'
        cost = distance * 4;
    case 'airplane'
        cost = distance * 10;
    otherwise
        disp('Invalid transportation mode.');
        cost = NaN; % Indicate an error with the cost
end
disp(['the total cost of using the ' model ' is ' num2str(cost)]);

% Create a script that translates a color code into its corresponding name using a switch statement. 
% Prompt the user for input and handle at least five different color codes.
colorCode = input('Enter the ColoCode :', 's');
switch colorCode
    case '123'
        color = 'red';
    case '456'
        color = 'green';
    case '789'
        color = 'blue';
    case '159'
        color = 'yellow';
    case '753'
        color = 'black';
    otherwise
        color = 'unknown';
end
disp(['the Color is ' color]);

%% Additional Challenge (Optional):
% Extend the cost calculation script by including an input for the number of miles and 
% then use the switch statement to calculate the total cost.
distance = input('Enter the Distance in miles: ');
if distance < 0
    disp('Distance must be positive.');
else
    model = input('Enter the Model "car, train, bus, or airplane":', 's');
    switch model
        case 'car'
            cost = distance * 3;
        case 'train'
            cost = distance * 5;
        case 'bus'
            cost = distance * 4;
        case 'airplane'
            cost = distance * 10;
        otherwise
            disp('Invalid transportation mode.');
            cost = NaN; % Indicate an error
    end
    if ~isnan(cost)
        disp(['The total cost of using the ' model ' is ' num2str(cost)]);
    end
end

%% Lab Assessment:
% Successful execution of scripts that demonstrate the use of while loops and switch statements.
% 
% Proper handling of different cases and user input.
% Correct results for factorial calculation and trip cost.

%% Lab Submission:
% Submit your MATLAB scripts with comments explaining your code.
