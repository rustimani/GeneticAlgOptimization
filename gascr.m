clear, clc
%options = gaoptimset('PopulationType', 'doubleVector', 'PopulationSize', 200, 'SelectionFcn', {@selectiontournament}, 'CrossoverFraction', 0.8, 'CrossoverFcn', {@crossoverarithmetic});
options = gaoptimset('PopulationType', 'doubleVector', 'PopulationSize', 500, 'SelectionFcn', {@selectiontournament}, 'CrossoverFraction', 0.8, 'CrossoverFcn', {@crossoverarithmetic});
tic
[x, fval, flag] = ga(@f, 2, options)
t = toc;
fprintf('Время поиска: %5.4f\n', t)
Golstein.m
function Y = MeshGrienwank(X)
  Y = zeros(size(X, 1), size(X, 2));
  for i = 1:size(X, 1)
      for j = 1:size(X, 2)
          Y(i, j) = f(squeeze(X(i, j, :))');
      end
  end      
end
