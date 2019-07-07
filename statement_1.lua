--Assignments:
-- Lua allows multiple assignment where a list of values is assigned to a list of variables.

a = "hello" .. "world"
print(a);
x = 5;

a,b = 10, 2*x

y=7;

print(a)
print(b)

-- we can use multiple assignment to swap two values, as in

x, y = y, x --swap x and y

print(x)
print("      ")
print(y)

--Lua always adjusts the number of values to the number of variables: when
--the list of values is shorter than the list of variables, the extra variables receive
--nil as their values; when the list of values is longer, the extra values are silently
--discarded:

a, b, c = 0,1
print(a,b,c)

-- local variables:

j = 10  -- global variable

local i = 1 -- local variable

-- Unlike global variables, local variables have their scope limited to the block
-- where they are declared. A block is the body of a control structure, the body of a
-- function, or a chunk (the file or string where the variable is declared):

x = 10
local i = 1

while i<x do
    local x = i*2 -- local to the while body
    print(x)
    i = i+1
end


if i > 20 then
    local x        -- local to the then body
    x = 20
    print(x+2)     -- print 22
else
    print(x)
end

c =4;

print(x)


-- This code won't run in interactive mode, because lua interpreter would interpret each line of code separately
-- We can solve this problem by delimiting the whole block explicitly, bracketing it with the keywords do-end.
-- once you enter do, the command comppletes only at the corresponding end.

do
    local a2 = 2*a
    local d = (b^2 - 4*a*c)^(1/2)
    x1 = (-b+d)/a2
    x2 = (-b-d)/a2
end
print(x1, x2)


-- Control structures

-- Lua provides a small and conventional set of control structures, with if for condi-tional
-- execution and while, repeat, and for for iteration. All control structures
-- have an explicit terminator: end terminates if, for and while structures; and
-- until terminates repeat structures.

-- if then else ( ex code snippets )

if a<0 then a=0 end

if a < b then return a else return b end

if line > MAXLINES then
    showpage()
    line = 0
end

if op == "+" then
    r = a+b
elseif op == "-" then
    r = a-b
elseif op == "*" then
    r = a*b
elseif op == "/" then
    r = a/b
else
    error("invalid operation")
end

-- Lua has no switch statement, hence such chains are very common

-- while
-- As usual, Lua first tests the while condition, if it is false loop terminates else continues.
local i = 1
while a[i] do
    print(a[i])
    i = i+1
end


--repeat
-- As the name suggests the repeat-until statement repeats its body until its condition is true.
-- the body is executed at least once

repeat
    line = os.read()
until line ~= ""
print(line)

-- Unlike in most other languages, in Lua the scope of a local variable declared inside the loop includes the condition

local sqr = x/2
repeat
    sqr = (sqr + x/sqr)/2
    local error = math.abs(sqr^2 - x)
until error < x/10000       -- 'error' still visible here

-- the for statement
-- Lua has two variants of for statement : the numeric for and the generic for

-- the numeric for has the following syntax:

--for var=exp1,exp2,exp3 do
--    <something>
--end

-- This loop will execute something for each value of var from exp1 to exp2, using
-- exp3 as the step to increment var. This third expression is optional; when
-- absent, Lua assumes 1 as the step value. As typical examples of such loops,we have

for i=1,f(x) do print(i) end
for i=10,1,-1 do print(i) end

-- If we want to use a loop without an upper limit, we can use math.huge:

for i=1,math.huge do
    if (0.3*i^3 -20*i^2 -500 >= 0) then
        print(i)
        break
    end
end

-- A typical mistake is to assume that the variable still exists after the loop ends:

for i=1,10 do print(i) end
max = i    -- WRONG since the scope of i was in the above for loop only and it has ended

-- Generic for

-- The generic for loop traverses all values returned by an iterator function:

for i,v in ipairs(a) do print(v) end

-- The basic Lua library provides ipairs, a handy iterator function to traverse
-- an array. For each step in that loop, i gets an index, while v gets the value
-- associated with this index. A similar example shows how we traverse all keys of
-- a table:

-- iterators

-- The standard libraries provide several iterators, which allow us to iterate over the lines of a
-- file (io.lines), the pairs of a table (pairs), the entries of an array (ipairs), the
-- words of a string (string.gmatch), and so on

-- The generic loop shares two properties with the numeric loop: the loop
-- variables are local to the loop body and you should never assign any value to them.

days = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}
revDays = {["Sunday"]= 1, ["Monday"] = 2, ["Tuesday"] = 3, ["Wednesday"] = 4, ["Thursday"] = 5, ["Friday"] = 6, ["Saturday"] = 7}
x = "Tuesday"
print(revDays[x])

-- We don't need to declare the reverse table manually. We can build it automatically from the original one:

revDays1 = {}

for k,v in pairs(days) do
    revDays1[v] = k
end

-- break and return statements
-- We use break statement to finish a loop. This statement breaks the inner loop that contains it.
-- A return statement returns occasional results from a function or simply finishes a function.

local i = 1
while a[i] do
    if a[i] == v then break end
    i = i+1
end

function foo ()
    return      -- syntax error
    -- 'return' is the last statement in the next block
    do return end  -- OK
    --<Other statements>
end





