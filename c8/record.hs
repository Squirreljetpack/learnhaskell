
data Person = Person { firstName :: String
                    , lastName :: String
                    , age :: Int
                    , height :: Float
                    , phoneNumber :: String
                    , flavor :: String
                    } deriving (Show)

guy = Person "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"
guy2 = Person {firstName="Ford", lastName="Mustang", age=1967, height=16.7,phoneNumber="555-5555",flavor="Rocky Road"}