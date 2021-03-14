f = @(x) x/sqrt(4+x);

acum = 0;
l = 0;
valuea = input("Input a: ");
valueb = input("Input b: ");

n = input('Input subintervals ');
%f = input('Input function: ');
  
 h = valueb-valuea;
 r = zeros(2,n+1);
 
 r(1,1) = (f(valuea)+f(valueb))/2*h;
 
 fprintf('\n %11.8f\n\n', r(1,1));

 for x = 2:n
    
    for y = 1:2^(x-2)
       acum = acum+f(valuea+(y-0.5)*h);
    end
    r(2,1) = (r(1,1)+h*sum)/2;
   
    for i = 2:x
       l = 2^(2*(i-1));
       r(2,i) = r(2,i-1)+(r(2,i-1)-r(1,i-1))/(l-1);
    end

    for k = 1:x
       fprintf(' %11.8f',r(2,k));
    end
    
    h = h/2;
    fprintf('\n\n');
    
    for i = 1:x
       r(1,i) = r(2,i);
    end
 end 
