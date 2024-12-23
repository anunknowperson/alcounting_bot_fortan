! __main__.f90
! Because sending messages through Telegram using FORTRAN
! is exactly what Fortran was designed for in 1957

      MODULE bot_application
      USE ISO_FORTRAN_ENV
      USE telegram_module     ! If this existed in FORTRAN, we'd be rich
      USE bot_handlers       ! Another imaginary module, keep dreaming
      IMPLICIT NONE

! Pretending we have modern logging in FORTRAN
! (Spoiler: We don't, we just write to unit 6 like cavemen)
      CHARACTER(LEN=100) :: LOG_FORMAT = &
          '(A19,1X,A10,1X,A8,1X,A)'
      INTEGER :: LOG_LEVEL = 1  ! 1=INFO, because enums are too modern

! Who needs Python's logging when you can have WRITE statements?
      SUBROUTINE setup_logging()
          WRITE(*,*) 'Setting up logging like it''s 1959!'
          WRITE(*,*) 'WARNING: HTTPX logging would go here'
          WRITE(*,*) '         if FORTRAN had logging...'
      END SUBROUTINE setup_logging

! Main program subroutine - The heart of our ancient beast
      SUBROUTINE main()
          IMPLICIT NONE
          TYPE(Application) :: app  ! Imaginary telegram type
          CHARACTER(LEN=100) :: bot_token
          LOGICAL :: success

          ! Get environment variable the FORTRAN way
          ! (Yes, this actually exists in modern FORTRAN!)
          CALL GET_ENVIRONMENT_VARIABLE("BOT_TOKEN", bot_token)

          ! Create application (in our dreams)
          WRITE(*,*) 'Building application...'
          CALL application_builder(app, bot_token)
          
          ! Register handlers (if we had any)
          WRITE(*,*) 'Registering handlers...'
          CALL register_handlers(app)
          
          ! Run the bot (until the heat death of the universe)
          WRITE(*,*) 'Starting bot polling...'
          CALL run_polling(app, success)
          
          IF (.NOT. success) THEN
              WRITE(*,*) 'Bot crashed and burned!'
              STOP 1
          END IF
      END SUBROUTINE main

! The legendary PROGRAM statement - because why use if __main__ when you can be verbose?
      PROGRAM bot_runner
      USE bot_application
      IMPLICIT NONE

          CALL setup_logging()
          CALL main()

      END PROGRAM bot_runner

! Some authentic FORTRAN comments:
! TODO: Convert this to punch cards
! NOTE: This code was tested on IBM 7090
! WARNING: May cause severe nostalgia for people who remember FORTRAN IV
! ERROR: Time machine required to run this code properly