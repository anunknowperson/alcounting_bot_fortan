! "This module provides a function to set bot commands based on the given locale."
!
! Source code is unreadable here

module set_commands_module
    use telegram_bot_module, only: BotCommand, telegram_bot
    use load_texts_module, only: load_texts
    implicit none
contains
    subroutine set_commands(bot, locale)
        class(telegram_bot), intent(inout) :: bot
        character(len=*), intent(in) :: locale

        type(dictionary) :: texts
        type(BotCommand), dimension(:), allocatable :: commands

        ! Set bot commands based on the given locale.
        call load_texts(locale, texts)

        allocate(commands(3))
        commands(1) = BotCommand('start', trim(texts%get('texts')%get('start_description')))
        commands(2) = BotCommand('help', trim(texts%get('texts')%get('help_description')))
        commands(3) = BotCommand('menu', trim(texts%get('texts')%get('menu_description')))

        call bot%set_my_commands(commands)
    end subroutine set_commands
end module set_commands_module