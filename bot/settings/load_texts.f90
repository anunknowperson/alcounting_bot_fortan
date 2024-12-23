! "This module provides a function to load localized texts from TOML files."
!
! Source code is unreadable here

module load_texts_module
    implicit none
contains
    subroutine load_texts(locale, texts)
        character(len=*), intent(in) :: locale
        type(dictionary), intent(out) :: texts
        ! Port this stuff to the language of gods
        ! Load localized texts from a TOML file based on the given locale.
        ! Args:
        !     locale (str): The locale code (e.g., "ru" or "en").
        ! Returns:
        !     dict: The loaded texts from the TOML file.

        character(len=2) :: loc
        if (locale == 'ru' .or. locale == 'en') then
            loc = locale
        else
            loc = 'ru'
        end if

        open(unit=10, file='res/locales/' // trim(loc) // '.toml', encoding='utf-8')
        ! Read TOML file and load into texts dictionary
        close(10)
    end subroutine load_texts
end module load_texts_module