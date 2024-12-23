MODULE ADMIN_MODULE
      ! The most powerful module in the universe
      ! With great power comes great responsibility
      ! ...and more FORTRAN syntax
      
      USE BARMAN_MODULE  ! Because inheritance in FORTRAN is totally a thing
      IMPLICIT NONE  ! Trust no variable
      
      ! TYPE ADMIN
      ! Extended from BARMAN because we didn't suffer enough
      ! This is the boss level of our FORTRAN adventure
      TYPE, EXTENDS(BARMAN) :: ADMIN
         LOGICAL :: is_watching_you = .TRUE.  ! Always watching, always judging
         INTEGER :: security_clearance = 9001  ! It's over 9000!
         CHARACTER(LEN=100) :: secret_password = 'FORTRAN77'  ! Most secure password ever
      END TYPE ADMIN
      
      ! That's it. This is all the admin does.
      ! But we made it in FORTRAN, so it's enterprise-grade now.
      ! If you're reading this, send help...
      
      END MODULE ADMIN_MODULE