function histogram = histogramforimageread(n)
x = zeros(1,256);
    for i = 1:(length(n)-1)
        for j = 1:(length(n(i,:))-1)
            x(1,n(i,j)+1) = x(1,n(i,j)+1)+1; 
        end
    end
    
 histogram = x;
end