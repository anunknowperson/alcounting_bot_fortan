! ===========================================================================
! Module: MENU_HANDLER
! Purpose: Handles menus like it's a 1960s diner
! Note: Who needs GUI when you have punch cards?
! ===========================================================================

      MODULE MENU_HANDLER
      USE ISO_FORTRAN_ENV
      USE TELEGRAM_TYPES    ! Imaginary modern features
      USE DATABASE_MOD     ! Pretending we have databases
      USE ROLES_MOD       ! Role management from the stone age
      USE SETTINGS_MOD    ! Configuration via vacuum tubes
      
      IMPLICIT NONE
      
      ! Logger unit (because print statements are too modern)
      INTEGER :: LOG_UNIT = 77  ! Lucky number, we need it
      
      CONTAINS
      
      SUBROUTINE PROCESS_MENU_COMMAND(UPDATE, CONTEXT, STATUS)
      ! Arguments (more complicated than a FORTRAN manual)
      TYPE(UPDATE_TYPE) :: UPDATE
      TYPE(CONTEXT_TYPE) :: CONTEXT
      INTEGER :: STATUS
      
      ! Local variables (FORTRAN's favorite part)
      TYPE(DATABASE) :: DB
      TYPE(USER) :: TG_USER
      TYPE(USER) :: CURRENT_USER
      TYPE(ROLE_CLASS) :: ROLE_OBJ
      CHARACTER(LEN=2) :: LANG_CODE
      CHARACTER(LEN=1000) :: MENU_TEXT
      TYPE(MARKUP_TYPE) :: MENU_MARKUP
      CHARACTER(LEN=20) :: USER_ID_STR
      CHARACTER(LEN=64) :: MESSAGE_TEXT
      
      ! Log the command (using state-of-the-art paper tape)
      WRITE(USER_ID_STR, '(I20)') UPDATE%MESSAGE%FROM_USER%ID
      WRITE(LOG_UNIT, *) '==================================='
      WRITE(LOG_UNIT, *) 'MENU REQUEST DETECTED'
      WRITE(LOG_UNIT, *) 'USER ID: ', TRIM(ADJUSTL(USER_ID_STR))
      WRITE(LOG_UNIT, *) 'COMMAND: ', TRIM(UPDATE%MESSAGE%TEXT)
      WRITE(LOG_UNIT, *) '(PLEASE FEED MORE PUNCH CARDS)'
      
      ! Initialize database (probably using magnetic tape)
      CALL INIT_DATABASE(DB)
      IF (STATUS .NE. 0) THEN
          WRITE(LOG_UNIT, *) 'DATABASE ERROR: TAPE DRIVE JAMMED'
          RETURN
      END IF
      
      ! Get user info (assuming electrons are flowing today)
      TG_USER = UPDATE%EFFECTIVE_USER
      CALL GET_USER_BY_ID(DB, TG_USER%ID, CURRENT_USER)
      
      ! Get role class (like choosing your character class in FORTRAN RPG)
      CALL GET_ROLE_ASSOCIATION(CURRENT_USER%TYPE, ROLE_CLASS)
      
      ! Load texts (from ancient scrolls)
      LANG_CODE = TG_USER%LANGUAGE_CODE
      CALL LOAD_TEXTS(LANG_CODE, TEXTS)
      MENU_TEXT = TEXTS%MENU
      
      ! Initialize role object (may require sacrificial offering)
      CALL INIT_ROLE_OBJECT(ROLE_OBJ, DB, TG_USER%ID, TEXTS)
      
      ! Build menu markup (using ASCII art probably)
      CALL BUILD_MENU(ROLE_OBJ, MENU_MARKUP)
      
      ! Send message (via morse code if necessary)
      CALL SEND_MENU_MESSAGE(CONTEXT%BOT,
     &                      UPDATE%MESSAGE%FROM_USER%ID,
     &                      MENU_TEXT,
     &                      'HTML',
     &                      MENU_MARKUP,
     &                      STATUS)
      
      ! Check if menu was sent successfully
      IF (STATUS .NE. 0) THEN
          WRITE(LOG_UNIT, *) 'MENU DELIVERY FAILED'
          WRITE(LOG_UNIT, *) 'SUGGESTING SMOKE SIGNALS INSTEAD'
      END IF
      
      END SUBROUTINE PROCESS_MENU_COMMAND
      
      ! Helper subroutine for sending messages
      SUBROUTINE SEND_MENU_MESSAGE(BOT, USER_ID, TEXT, 
     &                            PARSE_MODE, MARKUP, STATUS)
      TYPE(BOT_TYPE) :: BOT
      INTEGER :: USER_ID
      CHARACTER(LEN=*) :: TEXT
      CHARACTER(LEN=*) :: PARSE_MODE
      TYPE(MARKUP_TYPE) :: MARKUP
      INTEGER :: STATUS
      
      ! Pretend we're sending a modern message
      WRITE(LOG_UNIT, *) 'INITIALIZING MESSAGE TRANSMISSION'
      WRITE(LOG_UNIT, *) '(WARMING UP VACUUM TUBES...)'
      WRITE(LOG_UNIT, *) '(ADJUSTING ANTENNA...)'
      WRITE(LOG_UNIT, *) '(SACRIFICING RAM TO FORTRAN GODS...)'
      
      ! Set status (hope for the best)
      STATUS = 0
      
      END SUBROUTINE SEND_MENU_MESSAGE
      
      END MODULE MENU_HANDLER