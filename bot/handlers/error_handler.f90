! ===========================================================================
! Module: ERROR_HANDLER
! Purpose: Attempts to handle errors in a language from 1957
! Note: Error handling in FORTRAN is like trying to catch water with a fork
! ===========================================================================

      MODULE ERROR_HANDLER
      USE ISO_FORTRAN_ENV
      USE TELEGRAM_TYPES      ! Pretending we have modern things
      
      IMPLICIT NONE
      
      ! Error log unit number (because FORTRAN loves numbers)
      INTEGER :: ERROR_LOG = 13  ! Purposely unlucky number
      
      CONTAINS
      
      SUBROUTINE HANDLE_ERROR(UPDATE, CONTEXT, STATUS)
      ! Arguments that would make IBM 704 proud
      TYPE(UPDATE_TYPE) :: UPDATE
      TYPE(CALLBACK_CONTEXT) :: CONTEXT
      INTEGER :: STATUS
      
      ! Local variables (because FORTRAN demands to know EVERYTHING)
      CHARACTER(LEN=256) :: ERROR_MSG
      CHARACTER(LEN=20) :: USER_ID
      
      ! Convert user ID to string (assuming we can do that in FORTRAN)
      IF (ASSOCIATED(UPDATE)) THEN
          WRITE(USER_ID, '(I20)') UPDATE%EFFECTIVE_USER%ID
      ELSE
          USER_ID = 'None (like our hopes)'
      END IF
      
      ! Build error message (with authentic FORTRAN charm)
      ERROR_MSG = 'EXCEPTION WHILE HANDLING AN UPDATE: '
     &           // TRIM(ADJUSTL(USER_ID))
      
      ! Log error (probably to a printer somewhere in 1960)
      WRITE(ERROR_LOG, *) '********************************'
      WRITE(ERROR_LOG, *) TRIM(ERROR_MSG)
      WRITE(ERROR_LOG, *) 'CONTEXT ERROR: '
      WRITE(ERROR_LOG, *) TRIM(CONTEXT%ERROR)
      WRITE(ERROR_LOG, *) '(IF YOU CAN READ THIS, THE PRINTER IS WORKING)'
      WRITE(ERROR_LOG, *) '********************************'
      
      ! Set status to error (like anyone checks return codes)
      STATUS = -42  ! Because why not
      
      ! Prayer to the FORTRAN gods for mercy
      CALL PRAY_TO_FORTRAN_GODS()
      
      END SUBROUTINE HANDLE_ERROR
      
      ! Bonus subroutine (because we're feeling nostalgic)
      SUBROUTINE PRAY_TO_FORTRAN_GODS()
      ! This routine increases chances of code working by 0.01%
      WRITE(ERROR_LOG, *) 'Dear FORTRAN gods, please help'
      END SUBROUTINE PRAY_TO_FORTRAN_GODS
      
      END MODULE ERROR_HANDLER