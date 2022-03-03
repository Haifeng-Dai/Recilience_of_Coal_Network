function [A,x0h] = function_Node(A,parameter,n,x0h)

% parameter: 1: Random Removal of Nodes;
%            2: Remove the low-degree nodes;
%            3: Remove the high-degree nodes;

n = size(A,1) - n;
N = size(A,1);
if parameter == 1
    index = randperm(N, n);
    A(index, :) = [];
    A(:, index) = [];
    x0h(index) = [];
end

if parameter == 2
    for i = 1:N-1
        for j = 1:N-2
            degree_A = sum(A,2);
            index = find(degree_A(i:end) < degree_A(i), 1) + i - 1;
            if isempty(index)
                break
            else
                temp1 = A(i,:);
                A(i,:) = A(index,:);
                A(index,:) = temp1;
                temp2 = A(:,i);
                A(:,i) = A(:,index);
                A(:,index) = temp2;
                x0temp = x0h(index);
                x0h(i) = x0temp;
                x0h(index) = x0temp;
            end
        end
    end
    A = A(n+1:end,n+1:end);
    x0h = x0h(n+1:end);
end

if parameter == 3
    for i = 1:N-1
        for j = 1:N-2
            degree_A = sum(A,2);
            index = find(degree_A(i:end) < degree_A(i),1) + i - 1;
            if isempty(index)
                break
            else
                temp1 = A(i,:);
                A(i,:) = A(index,:);
                A(index,:) = temp1;
                temp2 = A(:,i);
                A(:,i) = A(:,index);
                A(:,index) = temp2;
                x0temp = x0h(index);
                x0h(i) = x0temp;
                x0h(index) = x0temp;
            end
        end
    end
    A = A(1:N-n, 1:N-n);
    x0h = x0h(1:N-n);
end