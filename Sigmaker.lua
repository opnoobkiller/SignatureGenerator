PreviousByteArray = PreviousByteArray
CurrentByteArray = CurrentByteArray

function Split (Str)
    local CharTable = {}
    for i=1, #Str do
        local Char = Str:sub(i,i)
        table.insert(CharTable, Char)
    end
    return CharTable
end

local function MakeSignature(bytesA, bytesB, highlight)
    local Shortest = {}
    local Longest = {}
    local Result = {}

    if #bytesA < #bytesB then
        Shortest = Split(bytesA)
        Longest = Split(bytesB)
    else
        Shortest = Split(bytesB)
        Longest = Split(bytesA)
    end

    for _, _ in pairs(Longest) do
        table.insert(Result, highlight)
    end

    for index, value in pairs(Shortest) do
        if value == Longest[index] then
            Result[index] = value
        end
    end

    return table.concat(Result, "")
end

function Start()
    print("This is the sigmaker 1.0 made in lua, and used for Cheat Engine!")
    print("if you don't know what an 'Array of Byte' or 'Signature' is, refer to the Cheat Engine documentation")
    io.write("Enter an AOB:")
    CurrentByteArray = io.read()
    io.write("Enter one more AOB:")
    PreviousByteArray = CurrentByteArray
    CurrentByteArray = io.read()
    print(MakeSignature(PreviousByteArray, CurrentByteArray, "?"))
end

Start()