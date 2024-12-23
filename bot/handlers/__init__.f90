! ==============================================================
! This module contains the handler registration for the bot.
! Warning: Contains enough SUBROUTINE calls to make you dizzy
! ==============================================================

      MODULE bot_handlers_registry
      USE ISO_FORTRAN_ENV
      USE telegram_handlers    ! Imaginary module for handlers
      IMPLICIT NONE

! Import our handlers (pretending these exist somewhere in FORTRAN land)
      INCLUDE 'bot/handlers/callback_handler.f90'
      INCLUDE 'bot/handlers/help_handler.f90'
      INCLUDE 'bot/handlers/menu_handler.f90'
      INCLUDE 'bot/handlers/start_handler.f90'
      INCLUDE 'bot/handlers/error_handler.f90'

! Because who needs simple Python decorators when you can have THIS?
      TYPE :: handler_type
          CHARACTER(LEN=20) :: command
          PROCEDURE(handler_interface), POINTER :: handler_ptr
      END TYPE handler_type

! Interface for handler procedures (FORTRAN's way of saying "I'm fancy")
      INTERFACE
          SUBROUTINE handler_interface(update, context)
              TYPE(update_type) :: update
              TYPE(context_type) :: context
          END SUBROUTINE handler_interface
      END INTERFACE

! The main registration subroutine - prepare for verbose glory!
      SUBROUTINE register_handlers(application)
          IMPLICIT NONE
          TYPE(application_type) :: application
          LOGICAL :: success

          ! Adding handlers one by one because we love verbosity
          WRITE(*,*) 'Registering handlers (FORTRAN style)...'

          ! Callback query handler (may cause quantum entanglement)
          CALL add_handler(application, &
               create_callback_handler(callback_handler), success)
          IF (.NOT. success) GOTO 999  ! Because GOTO is still cool in FORTRAN

          ! Command handlers (now with extra bureaucracy)
          CALL add_command_handler(application, "help", help_handler, success)
          IF (.NOT. success) GOTO 999

          CALL add_command_handler(application, "menu", menu_handler, success)
          IF (.NOT. success) GOTO 999

          CALL add_command_handler(application, "start", start_handler, success)
          IF (.NOT. success) GOTO 999

          ! Error handler (because errors in FORTRAN are extra special)
          CALL add_error_handler(application, error_handler, success)
          IF (.NOT. success) GOTO 999

          WRITE(*,*) 'All handlers registered successfully!'
          WRITE(*,*) '(Against all odds)'
          RETURN

          ! Error handling the FORTRAN way - with GOTO!
999       WRITE(*,*) 'Handler registration failed spectacularly!'
          STOP 'HANDLER_REGISTRATION_ERROR'

      END SUBROUTINE register_handlers

! Some authentic FORTRAN comments:
! TODO: Add more GOTO statements
! NOTE: This code is Y2K compliant (we think)
! WARNING: Side effects may include nostalgia and confusion
! ERROR: Modern programming concepts not found
! FIXME: Cannot fix - it's FORTRAN

      END MODULE bot_handlers_registry

! Because one END statement is never enough
! END PROGRAM ! Just kidding, this isn't needed here