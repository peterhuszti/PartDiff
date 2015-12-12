% Based on http://www.mathworks.com/matlabcentral/fileexchange/
%    32051-gauss-seidel-method/content/Gauss_Seidel.m
% Written By: Mohammad Y. Saadeh, on 06/14/2010, University of Nevada Las
% Vegas

function X = GaussSeidel(A,C)

n = length(C);
%Error_eval = ones(n,1);
X = zeros(n,1);

%while max(Error_eval) > 0.001
    %Z = X;  % save current values to calculate error later
    for i = 1:n
        j = 1:n; % define an array of the coefficients' elements
        j(i) = [];  % eliminate the unknow's coefficient from the remaining coefficients
        Xtemp = X;  % copy the unknows to a new variable
        Xtemp(i) = [];  % eliminate the unknown under question from the set of values
        X(i) = (C(i) - sum(A(i,j) * Xtemp)) / A(i,i);
    end
%    Error_eval = sqrt((X - Z).^2);
%end