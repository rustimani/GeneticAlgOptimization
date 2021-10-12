function R = arifmcross(P, ELITE, P_Cr)
  R = ELITE;
  w=rand(1);
  while size(R, 1) < size(P, 1)
      % выбор родителей
      p1 = P(floor(rand(1)*(size(P, 1) - 1) + 1), :);
      p2 = P(floor(rand(1)*(size(P, 1) - 1) + 1), :);
      % потомки
      H1=floor(w.*p1+(1-w).*p2);
      H2=floor(w.*p2+(1-w).*p1);
      
      if rand(1)<P_Cr
          R=[R;H1];
      end
      if rand(1)<P_Cr
          R=[R;H2];
      end
  end
end
