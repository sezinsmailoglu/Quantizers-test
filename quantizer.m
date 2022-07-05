function q = quantizer(n,m)
a = 256/m;
b = a/2:a:256;
x = zeros(length(n(:,1)),length(n(1,:)));
    for i = 1:(length(n)-1)
        for j = 1:(length(n(i,:))-1)
           if idivide(n(i,j),a) > 0
            x(i,j) = b(idivide(n(i,j),a));
           else 
            x(i,j) = b(1);
           end 
        end
    end
q = x;
end
