function [f, bn] = Llyodmax(an,quantizationlvls,M)
err = zeros(1,length(an));
bn = zeros(1,length(an));
quantizationlvl = zeros(1,M);

for j = 1:length(an)
    for i = 1:M-1
        if(an(j) <= quantizationlvls(i+1)) && (an(j) >= quantizationlvls(i))
            bn(j) =  quantizationlvls(i);
        elseif an(j) > max(quantizationlvls)
            bn(j) = max(quantizationlvls);
        end
    end
end
    for i = 1:M-1
    quantizationlvl(i) = expectation(an,quantizationlvls(i),quantizationlvls(i+1));
    end
    if max(err) > 0.1
        [f ,bn]= Llyodmax(an, quantizationlvl,M);
        histogram(bn,256);
    end
f = quantizationlvl;
end
