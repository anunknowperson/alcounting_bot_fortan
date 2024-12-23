! "This module initializes settings for the bot."
!
! Port this stuff to the language of gods

program init_settings
    ! Source code is unreadable here
    implicit none

    interface
        subroutine load_texts(locale, texts)
            character(len=*), intent(in) :: locale
            type(dictionary), intent(out) :: texts
        end subroutine load_texts

        subroutine set_commands(bot, locale)
            class(telegram_bot), intent(inout) :: bot
            character(len=*), intent(in) :: locale
        end subroutine set_commands
    end interface

    public :: load_texts, set_commands

end program init_settings