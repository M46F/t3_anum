diary('result.txt')
diary on

%Test nomor 1
testFunction(@nomor1, [1 2]');

%Test nomor 2
testFunction(@nomor2, [1 1 -0.5]');

%Test nomor 3
x = [-400 -200 200 400 -400 -200 200 400];
testFunction(@nomor3, [x]');
testFunction(@nomor3, [x x]');
testFunction(@nomor3, [x x x]');
testFunction(@nomor3, [x x x x]');
testFunction(@nomor3, [x x x x x]');

function testFunction(func, x)
    tic;
    res = lbfgs(func, x)
    res.X
    toc;
    disp('--------------------------------------------------------------')
    tic;
    res = ncg(func, x)
    res.X
    toc;
    disp('--------------------------------------------------------------')
    tic;
    res = tn(func, x)
    res.X
    toc;
    disp('--------------------------------------------------------------')
end