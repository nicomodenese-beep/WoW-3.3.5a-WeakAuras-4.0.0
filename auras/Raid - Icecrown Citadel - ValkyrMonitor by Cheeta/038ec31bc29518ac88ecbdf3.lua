function(a, b)
    if a.region.state.index and b.region.state.index then
        local v1, v2 = a.region.state.index, b.region.state.index
        return v1 < v2
    end
end