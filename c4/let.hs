-- let bindings are expressions while where is a syntactic construct
cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r^2
    in sideArea + 2*topArea

ex1 = [let n = 2; nsquare x = n * x * x in (nsquare 5, nsquare 3, nsquare 2)]
-- [(50,18,8)]
ex2 = (let (a,b,c) = (1,2,3) in a+b+c) * 100
-- 600

calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi >= 25.0]