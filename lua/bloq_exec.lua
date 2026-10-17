function init (args)
    local needs = {}
    needs["payload"] = tostring(true)
    return needs
end

function match(args)
    local p = args["payload"]
    if p == nil then return 0 end

    local texto = tostring(p)

    if string.find(texto, "%.exe") or string.find(texto, "%.sh") or string.find(texto, "%.bat") then
        io.write("\nTentativa de download de executável bloqueada!\n")
        io.flush()
        return 1
    end
    return 0
end