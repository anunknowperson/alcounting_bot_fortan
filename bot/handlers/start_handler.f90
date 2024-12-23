! ===========================================================================
! Module: START_HANDLER
! Purpose: Initiates user into the mysteries of FORTRAN
! Note: Starting things in FORTRAN is like starting a steam engine
! ===========================================================================

      MODULE START_HANDLER
      USE ISO_FORTRAN_ENV
      USE TELEGRAM_TYPES    ! Modern concepts we pretend to understand
      USE DATABASE_MOD     ! Because flat files are too simple
      USE SETTINGS_MOD    ! Configuration from the mainframe era
      
      IMPLICIT NONE
      
      ! Logger unit (because modern logging is overrated)
      INTEGER :: LOG_UNIT = 88  ! Back to the future!
      
      CONTAINS
      
      SUBROUTINE PROCESS_START_COMMAND(UPDATE, CONTEXT, STATUS)
      ! Arguments (more than a punch card can handle)
      TYPE(UPDATE_TYPE) :: UPDATE
      TYPE(CONTEXT_TYPE) :: CONTEXT
      INTEGER :: STATUS
      
      ! Local variables (FORTRAN's favorite hobby)
      TYPE(DATABASE) :: DB
      TYPE(USER) :: NEW_USER
      CHARACTER(LEN=2) :: LANG_CODE
      CHARACTER(LEN=1000) :: START_TEXT
      CHARACTER(LEN=20) :: USER_ID_STR
      CHARACTER(LEN=64) :: MESSAGE_TEXT
      
      ! Log the command (using cutting-edge paper technology)
      WRITE(USER_ID_STR, '(I20)') UPDATE%MESSAGE%FROM_USER%ID
      WRITE(LOG_UNIT, *) '>>>>> INITIATING START SEQUENCE <<<<<'
      WRITE(LOG_UNIT, *) 'USER ID: ', TRIM(ADJUSTL(USER_ID_STR))
      WRITE(LOG_UNIT, *) 'COMMAND: ', TRIM(UPDATE%MESSAGE%TEXT)
      WRITE(LOG_UNIT, *) '(PLEASE ENSURE PRINTER HAS ENOUGH PAPER)'
      
      ! Get effective user (assuming electricity is working)
      CALL GET_EFFECTIVE_USER(UPDATE, EFFECTIVE_USER)
      
      ! Initialize database (probably runs on coal)
      CALL INIT_DATABASE(DB)
      IF (STATUS .NE. 0) THEN
          WRITE(LOG_UNIT, *) 'DATABASE INITIALIZATION FAILED'
          WRITE(LOG_UNIT, *) '(HAVE YOU TRIED TURNING IT OFF AND ON?)'
          RETURN
      END IF
      
      ! Create new user (like creating life, but with more FORTRAN)
      CALL CREATE_NEW_USER(NEW_USER,
     &                    EFFECTIVE_USER%ID,
     &                    EFFECTIVE_USER%NAME)
      
      ! Insert user into database (using advanced hole-punching technology)
      CALL INSERT_USER(DB, NEW_USER, STATUS)
      IF (STATUS .NE. 0) THEN
          WRITE(LOG_UNIT, *) 'USER INSERTION FAILED'
          WRITE(LOG_UNIT, *) '(BLAME IT ON COSMIC RAYS)'
          RETURN
      END IF
      
      ! Load welcome text (from ancient manuscripts)
      LANG_CODE = EFFECTIVE_USER%LANGUAGE_CODE
      CALL LOAD_TEXTS(LANG_CODE, TEXTS)
      START_TEXT = TEXTS%START
      
      ! Reply with welcome message (via morse code if needed)
      CALL REPLY_TO_MESSAGE(UPDATE%MESSAGE, START_TEXT, STATUS)
      
      ! Final status check (optimism not included)
      IF (STATUS .NE. 0) THEN
          WRITE(LOG_UNIT, *) 'START SEQUENCE FAILED'
          WRITE(LOG_UNIT, *) 'SUGGESTING SWITCH TO COBOL'
      ELSE
          WRITE(LOG_UNIT, *) 'START SEQUENCE COMPLETED'
          WRITE(LOG_UNIT, *) '(MIRACLE OCCURRED)'
      END IF
      
      END SUBROUTINE PROCESS_START_COMMAND
      
      ! Helper subroutine for creating users
      SUBROUTINE CREATE_NEW_USER(USER, ID, NAME)
      TYPE(USER) :: USER
      INTEGER :: ID
      CHARACTER(LEN=*) :: NAME
      
      ! Initialize user (with authentic FORTRAN ceremony)
      WRITE(LOG_UNIT, *) 'INITIALIZING NEW USER STRUCTURE'
      WRITE(LOG_UNIT, *) '(PERFORMING RITUAL CALCULATIONS)'
      
      USER%ID = ID
      USER%NAME = NAME
      USER%TYPE = 'NEWCOMER'  ! Everyone starts as a peasant
      
      END SUBROUTINE CREATE_NEW_USER
      
      ! Helper subroutine for message replies
      SUBROUTINE REPLY_TO_MESSAGE(MESSAGE, TEXT, STATUS)
      TYPE(MESSAGE_TYPE) :: MESSAGE
      CHARACTER(LEN=*) :: TEXT
      INTEGER :: STATUS
      
      ! Pretend we're sending a message
      WRITE(LOG_UNIT, *) 'PREPARING TO SEND WELCOME MESSAGE'
      WRITE(LOG_UNIT, *) '(LOADING CARRIER PIGEONS...)'
      
      ! Set status (fingers crossed)
      STATUS = 0
      
      END SUBROUTINE REPLY_TO_MESSAGE
      
      END MODULE START_HANDLER