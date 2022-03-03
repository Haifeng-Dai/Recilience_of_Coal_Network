function A1 = function_delet_nodes(A, num, mode)

load('./Data/NodeLabel.mat','NodeLabel');

NodeLabels = isequal(mode, 0) * NodeLabel(1:num) + isequal(mode, 1) * NodeLabel(end - num + 1:end);
A(NodeLabels, :) = [];
A(:, NodeLabels) = [];

A1 = A;