function x = findMax(POPULATION_SIZE, P_Cr, P_M, GENERATION_NUM, ELITISM_N, N, LIM, DRAW_PLOT)
    I_2 = (-10:0.2:10);
    [X1_2, X2_2] = meshgrid(I_2, I_2);
    X_2(:, :, 1) = X1_2;
    X_2(:, :, 2) = X2_2;
    Y_2 = Golstein(X_2);
PLOT_RATE = 10;
Populations{1} = (LIM+1 + LIM) .* rand(POPULATION_SIZE, N) - LIM; % начальная популяция
DM = 5;
i = 1;
figure
while i <= GENERATION_NUM
    rel_i = i / GENERATION_NUM;
    if rel_i > 0.9
        ELITISM_N = floor(POPULATION_SIZE / 4);
    else
        if rel_i > 0.75
            ELITISM_N = floor(POPULATION_SIZE / 7);
        else
            if rel_i > 0.5
               ELITISM_N = floor(POPULATION_SIZE / 10);
            end
        end
    end
    Populations{i} = fitness(Populations{i});
    P = selection(Populations{i}, N);
    P = arifmcross(P, Populations{i}(1:ELITISM_N, 1:N), P_Cr);
    P = mutation(P, P_M, DM, LIM);
    i = i + 1;
    Populations{i} = P;
    
        if mod(i, PLOT_RATE) == 0 
            a=fix(i/PLOT_RATE);
            subplot(2,3,fix(i/PLOT_RATE))
            surf(X1_2, X2_2, Y_2)
            hold on
            plot3(Populations{i}(:, 1), Populations{i}(:, 2), f(Populations{i}), 'ob')
            xr=['поколение' ' ' int2str(i)]
           title(xr);
            hold off
        end
        if i==GENERATION_NUM
        figure, 
        surf(X1_2, X2_2, Y_2)
            hold on,plot3(Populations{i}(:, 1), Populations{i}(:, 2), f(Populations{i}), 'ob'),hold off
        end
    
end

x = mode(Populations{end});
end
