function success = simBets(budget, minBet, spins, target, rounds)

success = zeros(1,rounds);

for x = 1: rounds
    [unused1 profit] = cash(budget, minBet, spins, target);
    if profit > 0
        success(x) = 1;
    end
end

success = (length(find(success == 1)) / length(success)) * 100;