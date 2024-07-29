# Retrieve the theme settings
export def main [] {
    return {
        binary: '#ae81ff'
        block: '#66d9ef'
        cell-path: '#f9f8f5'
        closure: '#2aa198'
        custom: '#f8f8f2'
        duration: '#f4bf75'
        float: '#f92672'
        glob: '#f8f8f2'
        int: '#ae81ff'
        list: '#2aa198'
        nothing: '#f92672'
        range: '#f4bf75'
        record: '#2aa198'
        string: '#a6e22e'

        bool: {|| if $in { '#2aa198' } else { '#f4bf75' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#f92672' attr: 'b' }
            } else if $in < 6hr {
                '#f92672'
            } else if $in < 1day {
                '#f4bf75'
            } else if $in < 3day {
                '#a6e22e'
            } else if $in < 1wk {
                { fg: '#a6e22e' attr: 'b' }
            } else if $in < 6wk {
                '#2aa198'
            } else if $in < 52wk {
                '#66d9ef'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#f9f8f5'
            } else if $e < 1mb {
                '#2aa198'
            } else {{ fg: '#66d9ef' }}
        }

        shape_and: { fg: '#ae81ff' attr: 'b' }
        shape_binary: { fg: '#ae81ff' attr: 'b' }
        shape_block: { fg: '#66d9ef' attr: 'b' }
        shape_bool: '#2aa198'
        shape_closure: { fg: '#2aa198' attr: 'b' }
        shape_custom: '#a6e22e'
        shape_datetime: { fg: '#2aa198' attr: 'b' }
        shape_directory: '#2aa198'
        shape_external: '#2aa198'
        shape_external_resolved: '#2aa198'
        shape_externalarg: { fg: '#a6e22e' attr: 'b' }
        shape_filepath: '#2aa198'
        shape_flag: { fg: '#66d9ef' attr: 'b' }
        shape_float: { fg: '#f92672' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#2aa198' attr: 'b' }
        shape_globpattern: { fg: '#2aa198' attr: 'b' }
        shape_int: { fg: '#ae81ff' attr: 'b' }
        shape_internalcall: { fg: '#2aa198' attr: 'b' }
        shape_keyword: { fg: '#ae81ff' attr: 'b' }
        shape_list: { fg: '#2aa198' attr: 'b' }
        shape_literal: '#66d9ef'
        shape_match_pattern: '#a6e22e'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#f92672'
        shape_operator: '#f4bf75'
        shape_or: { fg: '#ae81ff' attr: 'b' }
        shape_pipe: { fg: '#ae81ff' attr: 'b' }
        shape_range: { fg: '#f4bf75' attr: 'b' }
        shape_raw_string: { fg: '#f8f8f2' attr: 'b' }
        shape_record: { fg: '#2aa198' attr: 'b' }
        shape_redirection: { fg: '#ae81ff' attr: 'b' }
        shape_signature: { fg: '#a6e22e' attr: 'b' }
        shape_string: '#a6e22e'
        shape_string_interpolation: { fg: '#2aa198' attr: 'b' }
        shape_table: { fg: '#66d9ef' attr: 'b' }
        shape_vardecl: { fg: '#66d9ef' attr: 'u' }
        shape_variable: '#ae81ff'

        foreground: '#f8f8f2'
        background: '#272822'
        cursor: '#f8f8f2'

        empty: '#66d9ef'
        header: { fg: '#a6e22e' attr: 'b' }
        hints: '#272822'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#a6e22e' attr: 'b' }
        search_result: { fg: '#f92672' bg: '#f9f8f5' }
        separator: '#f9f8f5'
    }
}

# Update the Nushell configuration
export def --env "set color_config" [] {
    $env.config.color_config = (main)
}

# Update terminal colors
export def "update terminal" [] {
    let theme = (main)

    # Set terminal colors
    let osc_screen_foreground_color = '10;'
    let osc_screen_background_color = '11;'
    let osc_cursor_color = '12;'
        
    $"
    (ansi -o $osc_screen_foreground_color)($theme.foreground)(char bel)
    (ansi -o $osc_screen_background_color)($theme.background)(char bel)
    (ansi -o $osc_cursor_color)($theme.cursor)(char bel)
    "
    # Line breaks above are just for source readability
    # but create extra whitespace when activating. Collapse
    # to one line and print with no-newline
    | str replace --all "\n" ''
    | print -n $"($in)\r"
}

export module activate {
    export-env {
        set color_config
        update terminal
    }
}

# Activate the theme when sourced
use activate