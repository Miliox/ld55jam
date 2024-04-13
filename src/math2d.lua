
function diff(x0, y0, x1, y1)
    return (x1 - x0), (y1 - y0)
end

function dist(x0, y0, x1, y1)
    dx, dy = diff(x0, y0, x1, y1)
    return sqrt(dx * dx + dy * dy)
end

function norm(x, y)
    if x == 0 and y == 0 then return 0, 0 end
    m = sqrt(x * x + y * y)
    return (x / m), (y / m)
end

