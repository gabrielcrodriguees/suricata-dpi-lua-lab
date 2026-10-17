local contador = 0
local PASS_CORRETA = "cisco"

function init (args)
    local needs = {}
    needs["payload"] = tostring(true)
    return needs
end

function match(args)
    local p = args["payload"]
    if p == nil then return 0 end
    local texto = tostring(p)

    if string.find(texto, "user=admin") and string.find(texto, "pass=") then

        local pass_tentada = string.match(texto, "pass=([^&%s]+)")

        if pass_tentada ~= PASS_CORRETA then
            contador = contador + 1
            io.write("\n[AVISO] Password incorreta! Tentativa #" .. contador .. "\n")

            if contador >= 3 then
                io.write("BLOQUEIO: 3 tentativas falhadas!\n")
                contador = 0
                io.flush()
                return 1
            end
        else
            contador = 0
            io.write("[INFO] Login bem sucedido. Contador resetado.\n")
        end
    end

    return 0
end