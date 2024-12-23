! ==============================================================
! This module initializes role associations for the bot.
! Good luck reading this ancient language from punch card era!
! ==============================================================

      MODULE bot_roles_init
      USE ISO_FORTRAN_ENV
      IMPLICIT NONE

! Who needs Python's clean imports when you can have this beauty?
      INCLUDE 'bot/roles/admin.f90'
      INCLUDE 'bot/roles/barman.f90'
      INCLUDE 'bot/roles/customer.f90'

! Look ma, I'm using derived types instead of Python classes!
! Because why make it simple when you can make it FORTRAN?
      TYPE role_type
          CHARACTER(LEN=20) :: role_name
          TYPE(role_pointer) :: role_class
      END TYPE role_type

! Arrays? Lists? Nah, we do it the FORTRAN way!
! Warning: This array contains pure chaos and confusion
      TYPE(role_type), DIMENSION(3) :: all = (/ &
          role_type("Admin", Admin), &
          role_type("Customer", Customer), &
          role_type("Barman", Barman) &
      /)

! Dictionary? Ha! We use arrays of derived types here!
! Because that's how we rolled in the 60s
      TYPE(role_type), DIMENSION(3) :: role_associations = (/ &
          role_type("admin", Admin), &
          role_type("customer", Customer), &
          role_type("barman", Barman) &
      /)

! Some good old FORTRAN comments to make you smile
! TODO: Convert this to FORTRAN 77 for extra pain
! NOTE: If you can read this, you're probably too old
! WARNING: This code may cause severe nostalgia

      CONTAINS
! Empty subroutines because why not?
! This is where the magic would happen if this was real
      SUBROUTINE initialize_roles()
          WRITE(*,*) 'Initializing roles like it''s 1957!'
      END SUBROUTINE initialize_roles

      END MODULE bot_roles_init