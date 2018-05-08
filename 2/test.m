diary on

%Test nomor 1
diary('result1.txt')
disp('FUNCTION 1')
testFunction(@nomor1, [1 2]');

%Test nomor 2
diary('result2.txt')
disp('FUNCTION 2')
testFunction(@nomor2, [1 1 -0.5]');

%Test nomor 3
diary('result3.txt')
disp('FUNCTION 3')
x = [-400 -200 200 400 -400 -200 200 400];
testFunction(@nomor3, x');
for i = 2:5
    temp = x;
    for n = 1:7
        temp = [temp x];
    end
    testFunction(@nomor3, temp');
    x = temp;
end

function testFunction(func, x)
    tols  = [1e-4 1e-6 1e-8 1e-10 1e-12];
    for tol = 1:length(tols)
        disp(['Tolerance : ',num2str(tols(tol))])
        tic;
        res = ncg(func, x, 'StopTol', tols(tol))
        res.X'
        toc;
        disp('--------------------------------------------------------------')
        tic;
        res = lbfgs(func, x, 'StopTol', tols(tol))
        res.X'
        toc;
        disp('--------------------------------------------------------------')
        tic;
        res = tn(func, x, 'StopTol', tols(tol))
        res.X'
        toc;
        disp('--------------------------x------------------------------------')  
    end
end