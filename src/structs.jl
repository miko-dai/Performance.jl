export DefaultArray

# This implements an array that returns a "default" value when
# accessed out of bounds. Example:
#     a = DefaultArray([1.0, 2.0], NaN)
#     a[1]   # returns 1.0
#     a[5]   # returns NaN (does not throw a BoundsError)
# However, this is a deliberately "amateurish" implementation
# and it has numerous deficiencies.

# To solve this problem, you'll have to improve the `struct` definition and modify/add constructors
# Hint: every aspect of the struct definition should be improved (not just the fields)

struct DefaultArray{T<:Any, N} <: AbstractArray{T,N}
    parentarray :: Array{T, N}
    defaultvalue :: T
end

function promote_cus(x::Array, y)
    # takes an array x and y (number or whatever) 
    # and promotes both so that the element type of the array x matches the type of y
    t = promote_type(eltype(x), typeof(y))
    x = Array{t}(x)
    y = convert(t, y)
    return (x, y)
end

DefaultArray(parentarray, defaultvalue) = DefaultArray{promote_type(eltype(parentarray), typeof(defaultvalue)), ndims(parentarray)}(promote_cus(parentarray, defaultvalue)[1], promote_cus(parentarray, defaultvalue)[2])

Base.getindex(a::DefaultArray{<:Any, N}, i::Vararg{Int,N}) where N = checkbounds(Bool, a, i...) ? a.parentarray[i...] : a.defaultvalue
Base.size(a::DefaultArray) = size(a.parentarray)
