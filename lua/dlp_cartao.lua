function init (args)
    local needs = {}
    needs["http.request_body"] = tostring(true)
    return needs
end

function match(args)

    local body = tostring(args["http.request_body"])

    if body == nil or #body == 0 then
        return 0
    end

    if body:find("%d%d%d%d-%d%d%d%d-%d%d%d%d-%d%d%d%d") then
        io.write("\nALERTA CRÍTICO: FUGA DE DADOS DETETADA!\n")
        io.write("Padrão de Cartão de Crédito encontrado no payload.\n")
        io.flush()
        return 1
    end

    return 0
end