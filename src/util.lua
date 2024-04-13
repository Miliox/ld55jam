function rev(array)
    res = {}
    for i = #array, 1, -1 do
        add(res, array[i])
    end
    return res
end