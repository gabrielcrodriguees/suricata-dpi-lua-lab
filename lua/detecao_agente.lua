function init (args)
    local needs = {}
    needs["payload"] = tostring(true)
    return needs
end

function match(args)
    local p = args["payload"]
    if p == nil then return 0 end

    local texto = tostring(p)

    if string.find(texto, "sqlmap") or string.find(texto, "nmap") or string.find(texto, "nikto") then
        io.write("\nFerramenta de scan detetada!\n")
        io.flush()
        return 1
    end
    return 0
end