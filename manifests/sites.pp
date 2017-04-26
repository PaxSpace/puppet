node default {
    class{'base_computer::member_user': }

    class{'install_programs': } ->
    class{'install_programs::install_gui': }
}

# node 'computer-name' {}
