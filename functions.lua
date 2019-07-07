--[[Functions are the main mechanism for abstraction of statements and expres-
sions in Lua. Functions can both carry out a specific task (what is sometimes
called procedure or subroutine in other languages) or compute and return val-
ues. In the first case, we use a function call as a statement; in the second case,
we use it as an expression. ]]

print(8*9, 9/8)
a = math.sin(3) + math.cos(10) -- statement
print(os.date()) -- as an expression
print("\n")
--[[Lua also offers a special syntax for object-oriented calls, the colon operator.
An expression like o:foo(x) is just another way to write o.foo(o, x), that is, to
call o.foo adding o as a first extra argument.]]

-- a function definition has a name (add, in the previous example),a list of parameters, and a body, which is a list of statements.

-- Several predefined functions in lua return multiple values
-- example : string.find() function which returns the start and final index of a pattern.

s,e = string.find("Hello Lua Users", "Lua")

print(s,e)

-- Functions written in lua also can return multiple results, by listing them all after the return keyword.

-- For example, a function to find the maximum element in an array can return both the maximum value and its location:

function maximum (a)
    local mi = 1
    local m = a[mi]
    for i,val in ipairs(a) do
        if val > m then
            mi = i;
            m = val
        end
    end
    return m, mi
end

print(maximum({8,10,78,23,12,5}))

--[[Lua always adjusts the number of results from a function to the circum-
stances of the call. When we call a function as a statement, Lua discards all
results from the function. When we use a call as an expression, Lua keeps only
the first result. We get all results only when the call is the last (or the only)
expression in a list of expressions. These lists appear in four constructions in
Lua: multiple assignments, arguments to function calls, table constructors, and
return statements.]]

function foo0 () end
function foo1 () return "a" end
function foo2 () return "a","b" end

x,y = foo2()   -- x="a" , y="b"
x = foo2()     -- x="a" , "b" is discarded
x,y,z = foo2() -- x="a" , y ="b", z = nil

--[[The print function may receive a variable number of arguments. If we write
f(g()) and f has a fixed number of arguments, Lua adjusts the number of
results of g to the number of parameters of f, as we saw previously.]]

-- A constructor collects all results from a call:
t = {foo0()}    -- t = {}  an empty table
t = {foo1()}    -- t = {"a"}
t = {foo2()}    -- t = {"a", "b"}

-- A statement like return f() returns all the values returned by f:
function foo (i)
    if i == 0 then return foo0()
    elseif i == 1 then return foo1()
    elseif i == 2 then return foo2()
    end
end

print(foo(1)) -- prints a
print(foo(2)) -- prints a  b
print(foo(0)) -- (no results)
print(foo(3)) -- (no results)

--You can force a call to return exactly one result by enclosing it in an extra pair of parentheses:
print((foo1()))

-- Beware that a return statement does not need parantheses around the returned value;
-- any pair of parentheses placed there counts as an extra pair.
-- So any statement like return (f(x)) always returns one single value, no matter how many values f returns.

-- A special function with multiple returns is unpack. It receives an array and returns as results all
-- elements from the array, starting from index 1.
--print(unpack{1 ,2 ,3 ,1 ,23 ,3})

-- There is a way to call a function with variable number of arguments using unpack

-- f(unpack(a))

-- The call to unpack returns all values in a, which become the arguments to f. For instance, if we execute
f = string.find
a = {"hello", "ll"}

-- define a function that accepts a variable number of arguments in Lua

function add (a)
    local s =0
    for i, v in ipairs{a} do
        s = s+v
    end
    return s
end

print(add(3,4,5,2,2,3))