%NewMatrix = [9.7,2.9,9.3;5.6,2.5,1.3];
%sum(NewMatrix(:,2))

%A = [3,2;9,7]
%B = [2,9;9,3]

%A+B

%A-B

%A.*B

%A./B

%A*B

%A/B

%C = [1,2,3]

%D = [4,5;6,7;8,9]

%D'

%AnotherMatrix = [4 5 6]

% always add  ; IF YOU Want to mae it a squred matrix 

%SquareMatrix = [1 2; 3 4]

%sin(AnotherMatrix)

%exp(AnotherMatrix)

%inv(SquareMatrix)

%det(SquareMatrix)

% a string coment section 
%{
A = "fortune";
if A == "Hi"
    B = "Bye"
elseif A == "hello world"
    B = "your First Program"
    % to put A after B you add + sign 
else
    B = "Goodbye  "  +  A
    
end
%}

% loops
%{
A = [1,2,3,4,5]
max = 5;
sum = 0;
for iter = 1:max
    sum = sum + A (iter)
end
%}

% there is an error a debugg you add = in line 64
B = [1,2,3,4];
iter =  1;
max = 4;
sum = 0;
while iter<max
    sum = sum + B(iter)

    iter = iter +1;
end
% in this grouping sturcture i get 15 for the first and i get 6 for the
% second 




