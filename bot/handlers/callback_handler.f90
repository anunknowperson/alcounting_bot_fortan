! ===========================================================================
! Module: CALLBACK_HANDLER
! Purpose: Handles those newfangled "callback" things that kids use these days
! Note: Converting Python to FORTRAN is like teaching a dinosaur to use Instagram
! ===========================================================================

      MODULE CALLBACK_HANDLER
      USE ISO_FORTRAN_ENV
      USE TELEGRAM_TYPES      ! If this existed in FORTRAN, we'd be in trouble
      USE DATABASE_MOD        ! Pretending we can do modern databases in FORTRAN
      USE ROLES_MOD          ! Role management (like it's some RPG game)
      USE SETTINGS_MOD       ! Because hardcoding values is too mainstream

      IMPLICIT NONE
      
      ! Logger? In FORTRAN? Oh sweet summer child...
      INTEGER :: LOG_UNIT = 42

      CONTAINS

      SUBROUTINE PROCESS_CALLBACK(UPDATE, CONTEXT, STATUS)
      ! Arguments that would make any FORTRAN programmer cry
      TYPE(UPDATE_TYPE) :: UPDATE
      TYPE(CALLBACK_CONTEXT) :: CONTEXT
      INTEGER :: STATUS

      ! Local variables (because we love declaring everything)
      TYPE(DATABASE) :: DB
      TYPE(USER) :: TG_USER
      TYPE(USER) :: CURRENT_USER
      CHARACTER(LEN=256) :: DATA
      CHARACTER(LEN=1000) :: TEXT
      TYPE(MARKUP_TYPE) :: MARKUP
      
      ! This comment is longer than most FORTRAN programs
      ! Original code was readable, but we fixed that
      
      ! Initialize database (probably by punching cards)
      CALL INIT_DATABASE(DB)
      
      ! Get user info (assuming telegram works in FORTRAN universe)
      TG_USER = UPDATE%EFFECTIVE_USER
      CALL GET_USER_BY_ID(DB, TG_USER%ID, CURRENT_USER)
      
      ! Extract callback data (good luck with that)
      DATA = UPDATE%CALLBACK_QUERY%DATA
      TEXT = ''
      MARKUP%EXISTS = .FALSE.
      
      ! Role management (because we need more complexity)
      IF (ASSOCIATED(CURRENT_USER%TYPE)) THEN
          CALL PROCESS_ROLE_CALLBACK(
     &    CURRENT_USER, TG_USER, DATA, TEXT, MARKUP, STATUS)
      ELSE
          WRITE(LOG_UNIT,*) 'ERROR: USER TYPE IS INCORRECT'
          WRITE(LOG_UNIT,*) '(PROBABLY BECAUSE ITS FORTRAN)'
      END IF
      
      ! Log callback data (to a punch card, naturally)
      WRITE(LOG_UNIT,*) 'CALLBACKDATA: ', TRIM(DATA)
      
      ! Answer callback query (via telegraph probably)
      CALL ANSWER_CALLBACK_QUERY(UPDATE%CALLBACK_QUERY)
      
      ! Edit message text (assuming we haven't crashed yet)
      CALL EDIT_MESSAGE_TEXT(UPDATE%CALLBACK_QUERY,
     &                      TEXT,
     &                      'HTML',
     &                      MARKUP)
      
      END SUBROUTINE PROCESS_CALLBACK

      ! Helper subroutine because we love those
      SUBROUTINE PROCESS_ROLE_CALLBACK(USER, TG_USER, DATA, 
     &                                TEXT, MARKUP, STATUS)
      TYPE(USER) :: USER
      TYPE(USER) :: TG_USER
      CHARACTER(LEN=*) :: DATA
      CHARACTER(LEN=*) :: TEXT
      TYPE(MARKUP_TYPE) :: MARKUP
      INTEGER :: STATUS
      
      ! Local variables (more declarations, yay!)
      TYPE(ROLE_CLASS) :: ROLE_OBJ
      CHARACTER(LEN=2) :: LANG_CODE
      
      ! Get texts (from stone tablets probably)
      LANG_CODE = TG_USER%LANGUAGE_CODE
      CALL LOAD_TEXTS(LANG_CODE, TEXTS)
      
      ! Process button tap (assuming buttons existed in 1957)
      CALL ON_BUTTON_TAP(ROLE_OBJ, DATA, TEXT, MARKUP)
      
      ! Error handling (FORTRAN style - pray it works)
      IF (LEN_TRIM(TEXT) .EQ. 0 .OR. .NOT. MARKUP%EXISTS) THEN
          TEXT = 'Callback, Err0r'
          CALL BUILD_MENU(ROLE_OBJ, MARKUP)
      END IF
      
      END SUBROUTINE PROCESS_ROLE_CALLBACK
      
      END MODULE CALLBACK_HANDLER