export sequence_of_three, alternate_items

function sequence_of_three(start)
    out = Float64[]
    push!(out, start, start+1, start+2)
    return out
end

function alternate_items(nrepeats::Integer, item1, item2)
    if typeof(item1) != Missing && typeof(item2) != Missing
        out = zeros(Int64, nrepeats*2)
    else
        out = zeros(Union{Missing, Int64}, nrepeats*2)
    end
    
    out[1:2:nrepeats*2] .= item1
    out[2:2:nrepeats*2] .= item2
    return out
end
