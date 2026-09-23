function get-hash
    echo -n $argv[1] | sha256sum | awk '{print $1}'
end
