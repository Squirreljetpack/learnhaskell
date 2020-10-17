data Person = Person { firstName :: String
                    , lastName :: String
                    , age :: Int
                    } deriving (Eq, Show, Read)

mikeD = Person {firstName = "Michael", lastName = "Diamond", age = 43}
adRock = Person {firstName = "Adam", lastName = "Horovitz", age = 41}
mca = Person {firstName = "Adam", lastName = "Yauch", age = 44}
beastieBoys = [mca, adRock, mikeD]

t1 = mikeD == Person {firstName = "Michael", lastName = "Diamond", age = 43}
t2 = mikeD `elem` beastieBoys
t3 = "mikeD is: " ++ show mikeD
t4 = read "Person {firstName =\"Michael\", lastName =\"Diamond\", age = 43}" == mikeD

-- Why is Eq necessary before Ord?
data Bool' = False' | True' deriving (Eq, Ord)
t5 = True'>False'
t6 = Just 3 `compare` Just 2

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday deriving (Eq, Ord, Show, Read, Bounded, Enum)
[minBound .. maxBound] :: [Day]