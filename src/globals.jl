export getchar, set_homedir, get_homedir

charset = 'a':'z'
getchar(idx::Int) = charset[idx]::Char

homedir = "wrong"

function set_homedir(path)
    global homedir = path
end
get_homedir() = homedir::String

