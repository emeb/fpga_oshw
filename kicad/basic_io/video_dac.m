% video_dac.m - test a weighted R DAC for video

% compute resistors
zo = 75;
vi = 3.3;
ilsb = (1.0/75)/15;
r = (([1 2 4 8]/8) * vi/ilsb)-75;

r = [390 820 1800 3600];

% test linearity & range
x = 0:15;
d = dec2bin(x)-48;
i3 = d(:,1)'.*vi/(r(1)+zo);
i2 = d(:,2)'.*vi/(r(2)+zo);
i1 = d(:,3)'.*vi/(r(3)+zo);
i0 = d(:,4)'.*vi/(r(4)+zo);
vo = zo*(i0+i1+i2+i3);
plot(x, vo);
