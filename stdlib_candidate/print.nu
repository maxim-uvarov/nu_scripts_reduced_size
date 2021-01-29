# A print command that concatenates arguments together with an optional separator
#    By default there will be no newline
def print [
    --separator(-s):any     # Optional separator (not yet flagged as optional?)
    ...rest                 # All of the parameters
    ] {
    let is_empty = $(= $separator | empty?)
    let num_of_rest = $(echo $rest | count)
    echo $rest | each --numbered {
        if $is_empty {
            build-string $it.item
        } {
            if $num_of_rest > $(= $it.index + 1) {
                build-string $it.item $separator
            } {
                build-string $it.item
            }
        }
    } | str collect
}

# > print 1 2 3 "four" -s '--'
# 1--2--3--four

# > print 1 2 3 "four"
# 123four

# An alternate print command that concatenates arguments together with an optional separator.
# This one uses str collect instead of build-string.
#    By default there will be no newline
def print2 [
    --separator(-s):any     # Optional separator (not yet flagged as optional?)
    ...rest                 # All of the parameters
    ] {
    let is_empty = $(= $separator | empty?)
    let num_of_rest = $(echo $rest | count)
    if $is_empty {
        echo $rest | str from | str collect
    } {
        echo $rest | str from | str collect $separator
    }
}

def print3 [
    --separator(-s):any     # Optional separator (not yet flagged as optional?)
    --flat(-f)              # If tables are found, flatten them
    ...rest                 # All of the parameters
    ] {
    let sep_empty = $(= $separator | empty?)
    let num_of_rest = $(echo $rest | count)
    echo $rest | each --numbered {
        if $sep_empty {
            if $(echo $it.item | count) > 1 && $flat {
                let flatter = $(echo $it.item | flatten | str from | str collect)
                build-string $flatter
            } {
                build-string $it.item
            }
        } {
            if $num_of_rest > $(= $it.index + 1) {
                if $(echo $it.item | count) > 1 && $flat {
                    let flatter = $(echo $it.item | flatten | str from | str collect $separator)
                    build-string $flatter $separator
                } {
                    build-string $it.item $separator
                }
            } {
                if $(echo $it.item | count) > 1 && $flat {
                    let flatter = $(echo $it.item | flatten | str from | str collect $separator)
                    build-string $flatter
                } {
                    build-string $it.item
                }
            }
        }
    } | str collect
}
