# learnhaskell

### The confusing bits of Haskell's type explained

Type means the type expression of its type constructor.
Expressions denote values, type expressions denote type values.
Type can be understood as an (immutable) object with the value of its type constructor, and rules of interaction defined by its type expression (which resembles the form of a function)
Kinds are the type of a type constructor.(More below)

types come in concrete (Int, Char) and polymorphic flavors (Either, type AssocList a b = [(a,b)]())
They are made up of value constructors (templates in C++)
All concrete types have kind \*. All values are concrete types.
Functions are types as well and have kind \*, I think?
E.g type FunctionType = Int -\> Int
Polymorphic costructors can be curried


types in Haskell are functions that return (a specific instance of) \* or Constraint or some other function that returns them
-\> \*:
data Either a b = Left a | Right b
Either is a type constructor, Left is a data constructor. These are different and in seperate namespaces.

data [a]() = []() | a : []() --Builtins have special syntax so this is pseudo-code
-\> Constraint/Context: 
class Functor f where
fmap :: (a -\> b) -\> f a -\> f b
(\<$) :: a -\> f b -\> f a
reads a type f is an instance of Functor if there is a (overloaded) operation fmap defined on it
The kind of the type of f=((-\>) r) must be \*-\>\* as seen from the type declaration

typeclasses are constraints like Eq and Num (interface)
instances implement typeclass for a type (constructor)
class YesNo a where
yesno :: a -\> Bool
instance YesNo [a]() where
yesno []() = False
yesno \_ = True

instance Functor ((-\>) r) where
fmap = (.)
((-\>) r) Takes a concrete type, returns a function (of polymorphic type) with its type fields determined (takes no more types), therefore of kind \*-\>\*

Polymorphic functions in haskell
parametrically polymorphic: length :: [a]() -\> Int
ad-hoc : Type classes
type families: Different return types?



### Notes
A list of everything else about types, maybe later

