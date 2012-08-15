function [bank profit maxCash maxBet n] = cash(budget, minBet, spins, target)
% [bank profit maxCash maxBet spins] = cash(budget, minBet, spins, target)

if spins <= 0
    finish = realmax;
else
    finish = spins;
    outcomes = floor(36.99*rand(1, finish)) > 18;
end

bet = minBet;
bank = [budget zeros(1,finish-1)];
maxBet = 0;
maxCash = bank;

for n = 2:finish+1
    if bet <= bank(n-1)
        bank(n) = bank(n-1) - bet;
    else
        bet = bank(n-1);        
    end
    if bet == 0
        break;
    else
        bank(n) = bank(n-1) - bet;
    end
    if outcomes(n-1) == 1
        bank(n) = bank(n) + (2*bet);
        if bank(n) > maxCash
            maxCash = bank(n);
        end
        if bank(n) >= target
            break;
        end
        bet = minBet;
    else
        bet = 2*bet;
        if bet > maxBet
            maxBet = bet;
        end
    end   
    
    %plot(bank(1:n));
    %getframe;
end
profit = bank(n) - budget;        