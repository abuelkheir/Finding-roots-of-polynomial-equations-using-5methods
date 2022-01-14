% This script is used to calculate roots by using the 5 methods.

while(true) 
fprintf('1) Bisection Method \n2)Secant Method\n3)False Position Method\n4)Newton Method\n5)Muller Method\n'); 

choice=input('Please enter a number : \n');
% 
if choice==1 
        fprintf('BISECTION METHOD\n');
        f=input('Enter your function\n','s');
        y=inline(f,'x');
        a=input('enter value of lower limit: \n ');
        b=input('enter the value of upper limit : \n');
        Errortol = input('enter the value of tollerance interval\n');
        if y(a)==0
            fprintf('a is one of the roots');
        end
        if y(b)==0
            fprintf('b is one of the roots');
        end
        n=ceil(log2((b-a)/Errortol));
        fprintf('i\t       a\t      b\t        c\t          fc\n');
        for i=1:n
            c=(a+b)/2;
            fc=y(c);
            fprintf('%d\t %f\t %f\t %f\t %f\n',i,a,b,c,fc);
            %if abs(fc)<=Errortol
             %   fprintf('c%d=%f is the approcimate root',i,c); 
              %  flag=1;
               % break 
           % end 
            if fc*y(a)<0
                b=c;
            else
                a=c;
            end
        end
        fprintf('c%d=%f is the approximate root\n',i,c);
end
%SECANT METHOD 
if choice==2 
    fprintf('Secant Method\n');
    f=input('Enter your function\n','s');
    y=inline(f,'x');  
    a=input('enter value of lower limit: \n ');
    b=input('enter the value of upper limit :\n');
    tol=input('Please enter tollernce\n');
    fa=y(a);
    fb=y(b);

    fprintf('i\t   a\t     fa\t            b\t           fb\t    c\t     fc\n');

    for i=0:20
        c=b-((fb*(b-a)) / (fb-fa));
        fc=y(c);
        fprintf('%d\t %f\t %f\t %f\t %f %f %f\n',i,a,fa,b,fb,c,fc);
        if abs(fc)<=tol 
            fprintf('c%d=%f is the approximate root',i,c);
            break 
        end

        a=b;
        fa=fb;
        b=c;
        fb=fc;
    end
end


    %false position
if choice==3 
    fprintf('FALSE POSITION METHOD\n');
    f=input('Enter your function\n','s');
    y=inline(f,'x');  
    a=input('enter value of lower limit: \n ');
    b=input('enter the value of upper limit : \n');
    tol=input('Please enter tollernce\n');
    fa=y(a);
    fb=y(b);

    fprintf('i\t   a\t     fa\t              b\t     fb\t          c\t    fc\t \n');

    for i=0:20
        c=b-((fb*(b-a)) / (fb-fa));
        fc=y(c);
        fprintf('%d\t %f\t %f\t %f\t %f %f %f\n',i,a,fa,b,fb,c,fc);
        if abs(fc)<=tol 
            fprintf('c%d=%f is the approximate root',i,c);
            flag=1; 
            break 
        end

        if fc*fa<0 
            b=c;
            fb=fc;
        else 
            a=c;
            fa=fc;
        end

    end
    if flag==0
        fprintf('c%d=%f is the approximate root\n',i,c);
    end
end

%Newton's Method 
if choice==4
    fprintf("NEWTON'S METHOD\n");
    
    InputFunction=input('Please enter Equation:  ','s'); %taking input from user 

    f=inline(InputFunction);

    z=diff(f(x)); %Differntiating the function 

    fdash=inline(z);

    x= input('Please enter Initial Point : \n ');

    tol= input('please enter tol : \n');
    iterrator= input('Please enter number of iterrations required\n');

    fprintf('i\tx\t\t f(x)\tfdash(x)\t x_next\n');



    for i=0:iterrator
        fx=f(x);
        fxdash=fdash(x);
        x_next=x-(fx/fxdash);
        fprintf('%d %f %f %f %f\n',i,x,fx,fxdash,x_next);
        if abs(fx)<tol
            fprintf('the aproximate root is x%d=%f',i,x);
            break;
        end  
        x=x_next; 
    end 
    fprintf('the aproximate root is x%d=%f\n',i,x);
    
end
    
%MULLER'S METHOD
if choice==5
    fprintf('MULLER METHOD\n');
    f=input('Enter your function\n','s');
    y=inline(f,'x');  
    P0=input('enter first point\n');
    P1=input('enter the second point:\n');
    P2=input('enter the third point :\n ');

    n=input('please enter number of itterations\n');
    errorTol=input('Please enter error tolerance\n');

    fprintf('Iterration\t Pnew\t     Error%\n');

    Pnew=0;
    for i=1:n
        Ho=P1-P0;
        H1=P2-P1;

        delta0= (y(P1)-y(P0))/Ho;
        delta1= (y(P2)-y(P1))/H1; 
        a=(delta1-delta0)/(H1+Ho);
        b=(a*H1)+delta1;
        c=y(P2);


        if b<0
            Pnew= (P2+((-2*c)/(b-sqrt((b^2)-(4*a*c)))));

        else
            Pnew= (P2+((-2*c)/(b+sqrt((b^2)-(4*a*c)))));
        end

        absError= (abs(Pnew-P2)/Pnew) * 100;
        if  absError < errorTol  || y(Pnew)==0 
          fprintf('\nThe root is %f\n',Pnew);
          flag=1; 
           break;
           end 
        P0=P1;
        P1=P2;
        P2=Pnew;

        ynew=y(Pnew);
        fprintf('\n%d\t \t    %f\t %f \t \n',i,Pnew,absError);
        flag=0;
    end

    if flag==0 
        fprintf('\nThe root is %f\n',Pnew);
    end
end
end











