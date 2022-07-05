function [f, quantizationlvl]= uniformquantization(an,M)
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
        elseif an(j) > max(quantizationlvls)
            bn(j) = max(quantizationlvls);
        end
        err(j) = an(j)-bn(j);
    end
end
figure; 
histogram(err);
quantizationlvl = quantizationlvls;
f = bn;
end
