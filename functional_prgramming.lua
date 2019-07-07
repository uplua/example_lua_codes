-- Functions in Lua are first-class values with proper lexical scoping.
-- first class values means in Lua, a function is a value with the same rights as conventional values
-- like numbers and strings.

-- Functions can be stored in variables (both global and local) and in tables,
-- can be passed as arguments and can be returned by other functions.

-- Having lexical scoping means that functions can access variables of their enclosing functions.
-- It also means that Lua properly contains the lambda calculus.

--[[Like any other variable holding any other value, we can manipulate
such variables in many ways. The following example, although a little silly,
shows the point:]]

a = {p = print}
a.p("Hello World")
print = math.sin   -- print now refers to sine function
a.p(print(1))
sin = a.p          -- sin now refers to the print function
sin(10, 20)


-- If functions are values, are there expressions that create functions? Yes. In
-- fact, the usual way to write a function in Lua, such as
function foo(x) return 2*x end

--It is just an instance of what we call syntactic sugar;
-- in other words, it simply is a way to write the following code:
foo = function (x) return 2*x end

--[[So, a function definition is in fact a statement (an assignment, more specifically)
that creates a value of type “function” and assigns it to a variable. We can see
the expression function (x) body end as a function constructor, just as {} is a
table constructor. We call the result of such function constructors an anonymous
function. Although we often assign functions to global variables, giving them
something like a name, there are several occasions when functions remain
anonymous.]]

--[[The table library provides a function table.sort, which receives a table and
    sorts its elements. Such a function must allow unlimited variations in the sort
    order: ascending or descending, numeric or alphabetical, tables sorted by a key,
    and so on. Instead of trying to provide all kinds of options, sort provides a
    single optional parameter, which is the order function: a function that receives
    two elements and returns whether the first must come before the second in the
    sorted list. For instance, suppose we have a table of records like this:]]

network = {
    {name = "grauna", IP = "210.26.30.34"},
    {name = "arraial", IP = "210.26.30.23"},
    {name = "lua", IP = "210.26.30.12"},
    {name = "derain", IP = "210.26.30.20"}
}

-- to sort the table by the field name in reverse alphabetical ordr, we just write:
table.sort(network, function (a,b) return (a.name > b.name) end)

-- A function that gets another function as an argument, such as sort, is what we cal
-- a 'higher order' function.

--[[ To further illustrate the use of higher-order functions, we will write a naive
implementation of a common higher-order function, the derivative. In an in-
    formal definition, the derivative of a function f in a point x is the value of
    (f (x + d) − f (x))/d when d becomes infinitesimally small.]]

function derivative (f, delta)
    delta = delta or 1e-4
    return function (x)
              return (f(x+delta) - f(x))/delta
            end
end

c = derivative(math.sin)
print(math.cos(10), c(10))

-- Given a function f, the call derivative(f) returns ( an approximation of) its derivative, which is another function
