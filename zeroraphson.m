function [zero, iter] = zeroraphson(a,epsilon,niter)
format long

    precisao = epsilon+1 ;
    n = 0 ;
    while (precisao>epsilon && n<niter)
        n = n + 1 ;
        b = a - f(a)/fl(a) ;
        precisao = abs((b-a)/a) ;
        a = b ;
    end
    zero = a ;
    iter = n ;