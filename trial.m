function [t,quantizationlvl] = trial(an,M)
bn = zeros(1,length(an));
quantizationlvls = zeros(1,M);
maxan = max(an);
minan = min(an);
err = zeros(1,length(an));
bn = zeros(1,length(an));
uniformlvlatlama = (maxan-minan)/M;
for i = 0:M-1
    quantizationlvls(i+1) = minan + i*uniformlvlatlama ;
end

for j = 1:length(an)
    for i = 1:M-1
        if(an(j) <= quantizationlvls(i+1)) && (an(j) >= quantizationlvls(i))
            bn(j) =  quantizationlvls(i);
            err(j) = an(j)-bn(j);
            if err(j) > 10
            quantizationlvls(i) = expectation(an,quantizationlvls(i),quantizationlvls(i+1))
            end
        elseif an(j) > max(quantizationlvls)
            bn(j) = max(quantizationlvls);
        end
    end
end
t = bn;
quantizationlvl = quantizationlvls;
end