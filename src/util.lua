function rev(array)
    local res = {}
    for i = #array, 1, -1 do
        add(res, array[i])
    end
    return res
end
