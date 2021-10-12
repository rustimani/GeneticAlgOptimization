function R = fitness(P)
  R = [P, f(P)];
  R = sortrows(R, size(R, 2)); % сортировка по возрастанию значения функции
end
mutation.m
function R = mutation(P, P_M, DM, LIM)
  R = P;
  for i = 1:size(R, 1)
      if rand(1) < P_M
          gen = floor(rand(1)*(size(P, 2) - 1) + 1);
          if P(i, gen) - DM >= -LIM
              b1 = P(i, gen) - DM;
          else
              b1 = -LIM;
          end
          if P(i, gen) + DM <= LIM
              b2 = P(i, gen) + DM;
          else
              b2 = LIM;
          end
          P(i, gen) = (b2 - b1)*rand(1) + b1;
      end
  end
end
