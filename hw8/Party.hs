{-# OPTIONS_GHC -Wall #-}
{-# OPTIONS_GHC -fno-warn-orphans #-} --Needed since we create an instance of a module in Employee.hs

module Party where

import qualified Employee as E

instance Semigroup E.GuestList where 
  (<>) (E.GL as funA) (E.GL bs funB) = (E.GL (as ++ bs) (funA + funB))

instance Monoid E.GuestList where
  mempty = E.GL [] 0

-- Adds an Employee to the GuestList
glCons :: E.Employee -> E.GuestList -> E.GuestList
glCons emp (E.GL gs f) = E.GL (emp:gs) (f + (E.empFun emp))

moreFun :: E.GuestList -> E.GuestList -> E.GuestList
moreFun x1@(E.GL _ fun1) x2@(E.GL _ fun2)
    | fun1 >= fun2 = x1
    | otherwise    = x2