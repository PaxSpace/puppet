node default {
    class{'base_computer': } ->
    class{'base_computer::update_modules': } ->
    class{'base_computer::member_user': }
}

# node 'computer-name' {}
