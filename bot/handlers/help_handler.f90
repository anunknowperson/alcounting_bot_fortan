! ===========================================================================
! Module: HELP_HANDLER
! Purpose: Provides help text (as if FORTRAN users need help)
! Note: If you need help with FORTRAN, you're already doomed
! ===========================================================================

      MODULE HELP_HANDLER
      USE ISO_FORTRAN_ENV
      USE TELEGRAM_TYPES    ! Modern stuff we wish we had
      USE SETTINGS_MOD     ! Where we keep our FORTRAN wisdom
      
      IMPLICIT NONE
      
      ! Logger unit (because printf is too mainstream)
      INTEGER :: LOG_UNIT = 66  ! Route 66, get it?
      
      CONTAINS
      
      SUBROUTINE PROCESS_HELP_COMMAND(UPDATE, CONTEXT, STATUS)
      ! Arguments (more complex than FORTRAN's creation story)
      TYPE(UPDATE_TYPE) :: UPDATE
      TYPE(CONTEXT_TYPE) :: CONTEXT
      INTEGER :: STATUS
      
      ! Local variables (FORTRAN demands sacrifices)
      CHARACTER(LEN=2) :: LANG_CODE
      CHARACTER(LEN=1000) :: HELP_TEXT
      CHARACTER(LEN=20) :: USER_ID_STR
      CHARACTER(LEN=64) :: MESSAGE_TEXT
      
      ! Convert user ID to string (magic!)
      WRITE(USER_ID_STR, '(I20)') UPDATE%MESSAGE%FROM_USER%ID
      
      ! Log the command usage (on punch cards, naturally)
      WRITE(LOG_UNIT, *) '*** HELP COMMAND INVOKED ***'
      WRITE(LOG_UNIT, *) 'USER ID: ', TRIM(ADJUSTL(USER_ID_STR))
      WRITE(LOG_UNIT, *) 'COMMAND: ', TRIM(UPDATE%MESSAGE%TEXT)
      WRITE(LOG_UNIT, *) '(WRITING TO PUNCH CARD 7 OF 999999)'
      
      ! Get user's language code (assuming they can read)
      LANG_CODE = UPDATE%EFFECTIVE_USER%LANGUAGE_CODE
      
      ! Load help text (from ancient scrolls)
      CALL LOAD_TEXTS(LANG_CODE, TEXTS)
      HELP_TEXT = TEXTS%HELP
      
      ! Reply with help text (via carrier pigeon)
      CALL REPLY_TO_MESSAGE(UPDATE%MESSAGE, HELP_TEXT, STATUS)
      
      ! Check if help was actually helpful (spoiler: it wasn't)
      IF (STATUS .NE. 0) THEN
          WRITE(LOG_UNIT, *) 'HELP FAILED - SUGGEST USING COBOL INSTEAD'
      END IF
      
      END SUBROUTINE PROCESS_HELP_COMMAND
      
      ! Helper subroutine (because we love unnecessary complexity)
      SUBROUTINE REPLY_TO_MESSAGE(MESSAGE, TEXT, STATUS)
      TYPE(MESSAGE_TYPE) :: MESSAGE
      CHARACTER(LEN=*) :: TEXT
      INTEGER :: STATUS
      
      ! Pretend we're sending a message
      WRITE(LOG_UNIT, *) 'ATTEMPTING TO SEND HELP...'
      WRITE(LOG_UNIT, *) '(PLEASE WAIT WHILE WE WARM UP THE VACUUM TUBES)'
      
      ! Set status (optimistically)
      STATUS = 0
      
      END SUBROUTINE REPLY_TO_MESSAGE
      
      END MODULE HELP_HANDLER