function fractalraphson(niter,janela,passo)
tamanho = round(janela/passo);

mk = [];
my = [];
mb = [];
mr = [];
mg = [];

for i=(-tamanho):tamanho
    for j=(-tamanho):tamanho
        gi = passo*i;
        gj = passo*j;
        [z,n] = zeroraphson(complex(gi,gj),1e-1,niter) ;
        p = angle(z) ;
        if  n == niter
            mk = [mk;gi gj];
        elseif -3*pi/4 <= p && p < -pi/4 
            mb = [mb;gi gj];
        elseif -pi/4 <= p && p < pi/4
            mg = [mg;gi gj];
        elseif pi/4 <= p && p < 3*pi/4
            my = [my;gi gj];
        elseif ((3*pi/4 < p && p <= pi) || (-pi <= p && p < -3*pi/4))
            mr = [mr;gi gj];
        end
    end
end

plot(mk(1:length(mk)),mk(length(mk)+1:2*length(mk)),'k.',mb(1:length(mb)),mb(length(mb)+1:2*length(mb)),'b.',my(1:length(my)),my(length(my)+1:2*length(my)),'y.',mg(1:length(mg)),mg(length(mg)+1:2*length(mg)),'g.',mr(1:length(mr)),mr(length(mr)+1:2*length(mr)),'r.','MarkerSize',2)
