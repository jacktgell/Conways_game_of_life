close all
clear all
hold all
clc


Params = 300; 
delay = 0.1; %time delay between frames
X = Params; %number of rows
Y = Params; %number of colums
%using the funtion i will uniformly distributed random numbers between the value of zero and one
Table = rand(X,Y) > 0.7;
Transition_table = zeros(X,Y);
figure(1)
imagesc(Table); %this will display the image with scaled colors
axis image; %scale the image axis
colormap('gray'); % this will convert to black and white pixels

while true
    Filtered_table = zeros(X,Y);
    %the outer 2 for loops to cycle through every cell in conways gam of life
    for j=1:1:X
        for i=1:1:Y
            %2 for loops which will cycle a 3X3 matrix around the each indivual element
            for inc_j=-1:1:1
                for inc_i=-1:1:1
                    x = j + inc_j;
                    y = i + inc_i;
                    
                    %when exceeding the X parameter wrap to otherside of matrix
                    if x == X+1
                        x = 1;
                    elseif x == 0
                        x = X;
                    end
                    %when exceeding the Y parameter wrap to otherside of matrix
                    if y == Y+1
                        y = 1;
                    elseif y == 0
                        y = Y;
                    end
                    
                    %sum the element
                    Filtered_table(j,i) = Filtered_table(j,i) + Table(x,y);
                    
                end
            end
        end
    end
    
    %sum of 9 elements subtract Table to correct the filtered table
    Filtered_table = Filtered_table - Table;
    
    %the outer 2 for loops to cycle through every cell in conways gam of life
    for j=1:1:X
        for i=1:1:Y
            %for the cell being alive
            if Table(i,j) == 1
                switch Filtered_table(i,j)
                    case 0
                        Transition_table(i,j) = 0;
                    case 1
                        Transition_table(i,j) = 0;
                    case 2
                        Transition_table(i,j) = 1;
                    case 3
                        Transition_table(i,j) = 1;
                    otherwise
                        Transition_table(i,j) = 0;
                end
            end
            %for the cell not being alive
            if Table(i,j) == 0
                if Filtered_table(i,j) == 3
                    Transition_table(i,j) = 1;
                end
            end
        end
    end
    Table = Transition_table; %replace overwrite table with new matrix
    imagesc(Table); %display new states to figure
    pause(delay); %delay between states
    
end


