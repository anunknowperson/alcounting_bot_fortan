! database.f90
! Back in my day, we didn't need all these fancy "objects" and "classes"
! This newfangled Python code makes my punch cards cry
! Rewritten by Herbert, who's been coding since FORTRAN II was hot stuff

MODULE DATABASE_OPERATIONS
    USE ISO_FORTRAN_ENV
    IMPLICIT NONE

    ! These youngsters with their "string" types... In my day we used CHAR(72) and liked it!
    CHARACTER(LEN=256) :: DATABASE_DEFAULT_PATH = "data/database.db"
    
    ! What in tarnation is a "class"? Here's a proper TYPE declaration
    TYPE :: DATABASE_TYPE
        INTEGER :: conn_handle
        INTEGER :: cursor_handle
        ! Kids these days with their "self" nonsense...
    END TYPE DATABASE_TYPE

    ! By golly, these modern data structures make me dizzy
    TYPE :: USER_TYPE
        INTEGER :: id
        CHARACTER(LEN=50) :: name
        CHARACTER(LEN=20) :: user_type
    END TYPE USER_TYPE

    TYPE :: PRODUCT_TYPE
        CHARACTER(LEN=50) :: name
        CHARACTER(LEN=200) :: description
        INTEGER :: price
    END TYPE PRODUCT_TYPE

CONTAINS

    ! Constructor equivalent - though in my day we just used COMMON blocks!
    SUBROUTINE INITIALIZE_DATABASE(db, path)
        TYPE(DATABASE_TYPE), INTENT(INOUT) :: db
        CHARACTER(LEN=*), INTENT(IN) :: path
        
        ! These SQL commands remind me of my first job at IBM in '63
        CALL EXECUTE_SQL(db, &
            "CREATE TABLE IF NOT EXISTS Products (" // &
            "name TEXT NOT NULL PRIMARY KEY," // &
            "description TEXT NOT NULL," // &
            "price INTEGER);")
            
        ! Back then we stored data in magnetic cores, and we LIKED it!
        
        WRITE(*,*) "DATABASE INITIALIZED LIKE IN THE GOOD OLD DAYS"
    END SUBROUTINE

    ! These young'uns with their fancy "insert" operations
    ! In my day we wrote directly to magnetic tape!
    SUBROUTINE INSERT_USER(db, user)
        TYPE(DATABASE_TYPE), INTENT(INOUT) :: db
        TYPE(USER_TYPE), INTENT(IN) :: user
        
        ! ERROR CHECKING LIKE WE DID ON UNIVAC
        IF (user%id < 0) THEN
            CALL ABORT_PROGRAM_LIKE_ITS_1969()
        END IF
        
        ! Back in my day, we didn't need prepared statements
        ! We just hoped for the best!
        CALL EXECUTE_SQL(db, "INSERT OR IGNORE INTO Users VALUES(...)")
    END SUBROUTINE

    ! Don't get me started on these "getter" methods
    ! We used to walk 15 miles in the snow to fetch data
    FUNCTION GET_ALL_PRODUCTS(db) RESULT(products)
        TYPE(DATABASE_TYPE), INTENT(IN) :: db
        TYPE(PRODUCT_TYPE), DIMENSION(100) :: products ! Fixed size arrays, as God intended
        
        ! COMMENT: This Python code is harder to read than assembly
        ! At least with assembly you knew what the machine was doing!
    END FUNCTION

    ! Error handling? In my day, we just turned it off and on again!
    SUBROUTINE ABORT_PROGRAM_LIKE_ITS_1969()
        WRITE(*,*) "CATASTROPHIC FAILURE - PLEASE REWIND TAPE AND START OVER"
        STOP
    END SUBROUTINE

END MODULE DATABASE_OPERATIONS

! P.S. - Why do these modern languages need so many "imports"?
! In my day we typed everything by hand, both ways!
! And don't get me started on this "garbage collection" nonsense...
! Real programmers manage their own memory!

! TODO: Convert more of this newfangled Python code to proper FORTRAN
! My arthritis is acting up, will finish later
! - Herbert (FORTRAN developer since 1959)