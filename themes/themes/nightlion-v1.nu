export def nightlion_v1 [] {
    # extra desired values for the nightlion_v1 theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#000000"
    # foreground: "#bbbbbb"
    # cursor: "#bbbbbb"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#55ff55"
        empty: "#276bd8"
        bool: "#ffffff"
        int: "#ffffff"
        filesize: "#ffffff"
        duration: "#ffffff"
        date: "#ffffff"
        range: "#ffffff"
        float: "#ffffff"
        string: "#ffffff"
        nothing: "#ffffff"
        binary: "#ffffff"
        cellpath: "#ffffff"
        row_index: "#55ff55"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#555555"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff55ff"
        shape_bool: "#55ffff"
        shape_int: "#ff55ff"
        shape_float: "#ff55ff"
        shape_range: "#ffff55"
        shape_internalcall: "#55ffff"
        shape_external: "#00dadf"
        shape_externalarg: "#55ff55"
        shape_literal: "#276bd8"
        shape_operator: "#f3f167"
        shape_signature: "#55ff55"
        shape_string: "#5fde8f"
        shape_string_interpolation: "#55ffff"
        shape_datetime: "#55ffff"
        shape_list: "#55ffff"
        shape_table: "#5555ff"
        shape_record: "#55ffff"
        shape_block: "#5555ff"
        shape_filepath: "#00dadf"
        shape_globpattern: "#55ffff"
        shape_variable: "#bb00bb"
        shape_flag: "#5555ff"
        shape_custom: "#5fde8f"
        shape_nothing: "#55ffff"
    }
}
