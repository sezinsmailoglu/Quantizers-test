function f = expectation(an,b,c)
condt = 0;
total = 0;
for i = 1:length(an)
    if(an(i) <= b) && (an(i) >= c)
        condt = condt + 1
        total = total + an(i);
    end
end
f = total/condt;
end 
