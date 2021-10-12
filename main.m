clear, clc

POPULATION_SIZE = 500;
GENERATION_NUM = 60;
P_Cr = 0.45;
P_M = 0.6;
ELITISM_N = floor(POPULATION_SIZE / 10);
N = 2;
LIM = 2;
PLOT = true;

tic
x = findMax(POPULATION_SIZE, P_Cr, P_M, GENERATION_NUM, ELITISM_N, N, LIM, PLOT);
time = toc;
fprintf('Функция принимает минимальное значение %5.3f в точке ', f(x));
disp(x)
fprintf('Время поиска: %5.4f\n', time);
