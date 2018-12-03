%Assignment 4

Turns = 100;
Players = 1000000;

Score = zeros(1,Players);

for i = 1:Turns
    Score = Score + randi([0 1],1,Players);
end

hist(Score,Turns/2)
title('Score')
xlabel('Rating')
ylabel('Frecuency')

mean(Score)
var(Score)
