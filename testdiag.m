function [resA, resB]=testdiag()
    for i = 0:1000000
        A=randi([-10, 10], 3, 3);
        B=randi([-10, 10], 3, 3);
        if isdiagable(A)==1 && isdiagable(B)==1
            if isdiagable(A+B) == 0
                resA = A;
                resB = B;
                return
            end
        end
    end