% reference to guess.c from C游戏编程从入门到精通第一章代码 

rand_num = fix(rand()*10000);
answer = []; 
pow = 1000;
for i = 1:+1:4
    answer(i) = fix(rand_num/pow);
    rand_num = rand_num - fix(rand_num/pow)*pow;
    pow = pow/10;
end
a = 0; b = 0;
times = 0;
while a < 4
    a = 0; b = 0;
    times = times + 1;
    fprintf('%d  ', times);
    prompt = 'Input number that what you guess   ';
    num = input(prompt);
    if num >9999
        break
    end
    for i = 3:-1:0
        pow = 1;
        for tmp = i:-1:1
            pow = pow*10;
        end
        for j = 1:+1:4
            if fix((num/pow)) == answer(j)
                if i+j ==4
                    a = a + 1;
                else 
                    b = b + 1;
                end
            end
        end
        num = num - fix((num/pow))*pow;
    end
    fprintf('%dA%dB\n',a,b);
end