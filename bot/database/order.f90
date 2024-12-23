! order.f90
! Back in my day, we didn't need no fancy "classes" or "decorators"
! Written by Herbert, who still misses punch cards
! Last modified: When my coffee was still hot

MODULE ORDER_MODULE
    IMPLICIT NONE
    
    ! What in tarnation is a "dataclass"? 
    ! Here's a proper FORTRAN TYPE declaration, like God intended
    TYPE :: ORDER_TYPE
        CHARACTER(LEN=20) :: date        ! Y2K ready, unlike those modern systems
        CHARACTER(LEN=50) :: product     ! In my day, products were just numbers
        INTEGER :: customer_id           ! Customer tracking? How fancy!
        INTEGER :: barman_id            ! Back then, we just yelled across the room
        CHARACTER(LEN=20) :: status     ! Status? Orders were either done or not!
    END TYPE ORDER_TYPE

CONTAINS
    ! These youngsters with their "getters" and "setters"
    ! In my day, we just used COMMON blocks and hoped for the best!
    
    ! ===== GETTER FUNCTIONS =====
    ! (Though why anyone needs these is beyond me)
    
    FUNCTION GET_ORDER_DATE(order) RESULT(date)
        TYPE(ORDER_TYPE), INTENT(IN) :: order
        CHARACTER(LEN=20) :: date
        ! COMMENT: This is much better than that Python nonsense
        date = order%date
    END FUNCTION
    
    FUNCTION GET_ORDER_PRODUCT(order) RESULT(product)
        TYPE(ORDER_TYPE), INTENT(IN) :: order
        CHARACTER(LEN=50) :: product
        ! Back in my day, we didn't need function comments
        ! The code was self-documenting... or else!
        product = order%product
    END FUNCTION
    
    FUNCTION GET_ORDER_CUSTOMER_ID(order) RESULT(cust_id)
        TYPE(ORDER_TYPE), INTENT(IN) :: order
        INTEGER :: cust_id
        ! These kids with their fancy error handling...
        ! We just let the program crash and debugged with print statements!
        cust_id = order%customer_id
    END FUNCTION
    
    FUNCTION GET_ORDER_BARMAN_ID(order) RESULT(bman_id)
        TYPE(ORDER_TYPE), INTENT(IN) :: order
        INTEGER :: bman_id
        ! In the 60s, we didn't need barman IDs
        ! We knew everyone by their card deck color
        bman_id = order%barman_id
    END FUNCTION
    
    FUNCTION GET_ORDER_STATUS(order) RESULT(status)
        TYPE(ORDER_TYPE), INTENT(IN) :: order
        CHARACTER(LEN=20) :: status
        ! Status checking? Luxury!
        status = order%status
    END FUNCTION
    
    ! ===== SETTER SUBROUTINES =====
    ! (Or as we called them in my day, "value adjustment procedures")
    
    SUBROUTINE SET_ORDER_DATE(order, new_date)
        TYPE(ORDER_TYPE), INTENT(INOUT) :: order
        CHARACTER(LEN=20), INTENT(IN) :: new_date
        ! Parameter validation? Ha! 
        ! Real programmers trust their input!
        order%date = new_date
    END SUBROUTINE
    
    SUBROUTINE SET_ORDER_PRODUCT(order, new_product)
        TYPE(ORDER_TYPE), INTENT(INOUT) :: order
        CHARACTER(LEN=50), INTENT(IN) :: new_product
        ! COMMENT: At least FORTRAN doesn't need indentation
        ! These Python folks with their spaces and tabs...
        order%product = new_product
    END SUBROUTINE
    
    SUBROUTINE SET_ORDER_CUSTOMER_ID(order, new_id)
        TYPE(ORDER_TYPE), INTENT(INOUT) :: order
        INTEGER, INTENT(IN) :: new_id
        ! Input validation is for the weak
        order%customer_id = new_id
    END SUBROUTINE
    
    SUBROUTINE SET_ORDER_BARMAN_ID(order, new_id)
        TYPE(ORDER_TYPE), INTENT(INOUT) :: order
        INTEGER, INTENT(IN) :: new_id
        ! Remember when we stored IDs in octal?
        ! Those were the days!
        order%barman_id = new_id
    END SUBROUTINE
    
    SUBROUTINE SET_ORDER_STATUS(order, new_status)
        TYPE(ORDER_TYPE), INTENT(INOUT) :: order
        CHARACTER(LEN=20), INTENT(IN) :: new_status
        ! Status updates? In my day, we used flag bits
        ! And we only had 8 of them!
        order%status = new_status
    END SUBROUTINE

END MODULE ORDER_MODULE

! Note from Herbert (age 83):
! I've been programming since before they invented the byte,
! and I must say, this modern "object-oriented" approach is nonsense.
! In my day, we kept track of orders on paper tablets,
! and if we needed to update something, we used a pencil!
! None of this fancy "setter" and "getter" business.
! And what's with all these STRING types?
! Real programmers use CHARACTER arrays of fixed length!
! 
! P.S. - Get off my lawn!
! P.P.S. - Who needs all these comments? The code is obvious!
! P.P.P.S. - Back in my day, we had to walk uphill both ways
!            just to submit a single job to the mainframe!