! user.f90
! Rewritten by Herbert (still maintains code on magnetic tape)
! These young'uns with their "classes" and "data validation"...
! Last modified: Right after my afternoon nap

MODULE USER_MODULE
    IMPLICIT NONE
    
    ! Constants like we did in the good old days
    INTEGER, PARAMETER :: MAX_NAME_LENGTH = 50
    INTEGER, PARAMETER :: MAX_TYPE_LENGTH = 20
    
    ! By golly, a proper TYPE declaration!
    ! None of this newfangled "dataclass" nonsense
    TYPE :: USER_TYPE
        INTEGER :: id                           ! Simple integer, like God intended
        CHARACTER(LEN=MAX_NAME_LENGTH) :: name  ! None of that dynamic length tomfoolery
        CHARACTER(LEN=MAX_TYPE_LENGTH) :: type  ! Default value? In my day we initialized everything manually!
    END TYPE USER_TYPE
    
    ! These kids today with their "enums"... 
    ! We'll do it the proper way - with CHARACTER arrays!
    CHARACTER(LEN=20), DIMENSION(3), PARAMETER :: VALID_TYPES = (/ &
        "barman  ", &
        "admin   ", &
        "customer" /)

CONTAINS
    ! ===== INITIALIZATION SUBROUTINE =====
    ! (Because constructors are for the weak!)
    
    SUBROUTINE INITIALIZE_USER(user, id, name, type)
        TYPE(USER_TYPE), INTENT(OUT) :: user
        INTEGER, INTENT(IN) :: id
        CHARACTER(LEN=*), INTENT(IN) :: name
        CHARACTER(LEN=*), INTENT(IN) :: type
        
        ! Input validation like we did on the UNIVAC!
        IF (.NOT. IS_VALID_TYPE(type)) THEN
            CALL ABORT_WITH_PUNCH_CARD_ERROR()
        END IF
        
        user%id = id
        user%name = name
        user%type = type
        
        ! In my day, we didn't need no stinkin' return values
        ! If it didn't crash, it worked!
    END SUBROUTINE
    
    ! ===== GETTER FUNCTIONS =====
    ! (Though why anyone needs these is beyond me.
    !  In my day we just used PEEK and POKE!)
    
    FUNCTION GET_USER_NAME(user) RESULT(name)
        TYPE(USER_TYPE), INTENT(IN) :: user
        CHARACTER(LEN=MAX_NAME_LENGTH) :: name
        ! COMMENT: Simple and elegant, unlike that Python mess
        name = user%name
    END FUNCTION
    
    FUNCTION GET_USER_ID(user) RESULT(id)
        TYPE(USER_TYPE), INTENT(IN) :: user
        INTEGER :: id
        ! Back in my day, IDs were octal numbers
        ! And we LIKED it that way!
        id = user%id
    END FUNCTION
    
    FUNCTION GET_USER_TYPE(user) RESULT(type)
        TYPE(USER_TYPE), INTENT(IN) :: user
        CHARACTER(LEN=MAX_TYPE_LENGTH) :: type
        ! User types? In my day we just had "operator" and "not operator"
        type = user%type
    END FUNCTION
    
    ! ===== SETTER SUBROUTINES =====
    ! (Or as we called them in 1960, "memory modification procedures")
    
    SUBROUTINE SET_USER_NAME(user, new_name)
        TYPE(USER_TYPE), INTENT(INOUT) :: user
        CHARACTER(LEN=*), INTENT(IN) :: new_name
        ! String truncation? That's a feature, not a bug!
        user%name = new_name
    END SUBROUTINE
    
    SUBROUTINE SET_USER_ID(user, new_id)
        TYPE(USER_TYPE), INTENT(INOUT) :: user
        INTEGER, INTENT(IN) :: new_id
        ! Error checking is for the weak!
        user%id = new_id
    END SUBROUTINE
    
    SUBROUTINE SET_USER_TYPE(user, new_type)
        TYPE(USER_TYPE), INTENT(INOUT) :: user
        CHARACTER(LEN=*), INTENT(IN) :: new_type
        
        ! Proper error checking, like we did on the IBM 704
        IF (.NOT. IS_VALID_TYPE(new_type)) THEN
            CALL ABORT_WITH_PUNCH_CARD_ERROR()
        END IF
        
        user%type = new_type
    END SUBROUTINE
    
    ! ===== UTILITY FUNCTIONS =====
    ! (Because sometimes even FORTRAN needs helper routines)
    
    FUNCTION IS_VALID_TYPE(test_type) RESULT(is_valid)
        CHARACTER(LEN=*), INTENT(IN) :: test_type
        LOGICAL :: is_valid
        INTEGER :: i
        
        ! Linear search - good enough for the Apollo guidance computer,
        ! good enough for us!
        is_valid = .FALSE.
        DO i = 1, SIZE(VALID_TYPES)
            IF (TRIM(test_type) == TRIM(VALID_TYPES(i))) THEN
                is_valid = .TRUE.
                EXIT
            END IF
        END DO
    END FUNCTION
    
    ! Error handling like real programmers do it!
    SUBROUTINE ABORT_WITH_PUNCH_CARD_ERROR()
        WRITE(*,*) "FATAL ERROR - INVALID USER TYPE"
        WRITE(*,*) "PLEASE CHECK CARD SEQUENCE AND RESUBMIT"
        WRITE(*,*) "SYSTEM HALTED - CALL YOUR SYSTEM OPERATOR"
        ! In my day, we didn't have exceptions
        ! We just pulled the emergency stop switch!
        STOP
    END SUBROUTINE

END MODULE USER_MODULE

! Note from Herbert (still misses vacuum tubes):
! These modern programmers with their "exception handling" and "type safety"...
! Back in my day, we didn't need all these safeguards!
! If a program crashed, you just restarted the computer - 
! all 18,000 vacuum tubes of it!
!
! And what's with all these "string" types?
! In my day, we used HOLLERITH constants, and we were grateful!
!
! Don't even get me started on this "default parameter" business.
! Real programmers initialize their variables by hand,
! one card at a time!
!
! Now if you'll excuse me, I need to go oil my abacus...
!
! P.S. - Kids these days don't appreciate proper column alignment
! P.P.S. - I still think structured programming was a mistake
! P.P.P.S. - Get off my lawn!