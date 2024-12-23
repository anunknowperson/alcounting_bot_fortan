MODULE BOT_TYPES
      ! Look ma, I'm writing types in FORTRAN! 
      ! Who needs Python's fancy OOP when you have good ol' derived types?
      
      TYPE DATABASE
         ! Nobody knows what's inside, it's a mystery box
         INTEGER :: magic_number
      END TYPE DATABASE

      TYPE CUSTOMER
         ! Base type for those pesky customers
         ! Original code was readable, let's fix that
         INTEGER :: tg_user_id
         TYPE(DATABASE) :: db
         CHARACTER(LEN=1000) :: texts(100)  ! Arrays, because why not
      END TYPE CUSTOMER

      TYPE, EXTENDS(CUSTOMER) :: BARMAN
         ! A barman is just a customer with extra privileges
         ! and extra headaches
         LOGICAL :: is_actually_drinking
      END TYPE BARMAN

      ! Buttons? In Fortran? What sorcery is this?
      TYPE INLINE_BUTTON
         CHARACTER(LEN=100) :: text
         CHARACTER(LEN=100) :: callback_data
      END TYPE INLINE_BUTTON
      END MODULE BOT_TYPES

      MODULE BARMAN_MODULE
      USE BOT_TYPES
      IMPLICIT NONE  ! Because we're responsible programmers... sometimes
      
      CONTAINS
      
      SUBROUTINE CREATE_BARMAN_BUTTONS_MENU(self, buttons)
         ! Creating buttons in FORTRAN feels wrong on so many levels
         TYPE(BARMAN), INTENT(IN) :: self
         TYPE(INLINE_BUTTON), DIMENSION(:), ALLOCATABLE, INTENT(OUT) :: buttons
         
         ! Here we would call the customer menu buttons
         ! But this is FORTRAN, so we'll just pretend
         CALL PRETEND_THIS_WORKS()
         
         ! Add queue button because we can
         CALL ADD_BUTTON(buttons, self%texts(42), self%texts(42))
      END SUBROUTINE

      SUBROUTINE BUILD_MENU(self, markup)
         ! Building menus like it's 1957
         TYPE(BARMAN), INTENT(IN) :: self
         TYPE(INLINE_BUTTON), DIMENSION(:), ALLOCATABLE, INTENT(OUT) :: markup
         
         CALL CREATE_BARMAN_BUTTONS_MENU(self, markup)
         ! Now pray it works
      END SUBROUTINE

      SUBROUTINE BUILD_QUEUE_MENU(self, markup)
         ! Queue management: FORTRAN edition
         ! Warning: May cause temporal paradoxes
         TYPE(BARMAN), INTENT(IN) :: self
         TYPE(INLINE_BUTTON), DIMENSION(:), ALLOCATABLE, INTENT(OUT) :: markup
         
         ! Get orders queue
         ! In Python this was one line
         ! In FORTRAN it's... well... this
         INTEGER :: i, num_orders
         TYPE(ORDER), DIMENSION(100) :: my_orders  ! Fixed size because we live dangerously
         
         CALL GET_ORDERS_QUEUE(self%db, my_orders, num_orders)
         
         IF (num_orders > 0) THEN
            DO i = 1, num_orders
               ! Creating buttons for each order
               ! This would be elegant in Python
               ! Here it's just painful
               WRITE(temp_str, '(A,A,A)') TRIM(my_orders(i)%date), ' ', &
                                         TRIM(my_orders(i)%product)
               CALL ADD_BUTTON(markup, temp_str, 'complete_'//TRIM(my_orders(i)%date))
            END DO
         ELSE
            ! No orders? Time for coffee break
            CALL LOG_MESSAGE('No orders in database. Going for coffee.')
         END IF
      END SUBROUTINE

      SUBROUTINE HANDLE_QUEUE_BUTTON(self, text, markup)
         ! Handling queue button presses since 1957
         TYPE(BARMAN), INTENT(IN) :: self
         CHARACTER(LEN=*), INTENT(OUT) :: text
         TYPE(INLINE_BUTTON), DIMENSION(:), ALLOCATABLE, INTENT(OUT) :: markup
         
         CALL LOG_MESSAGE('Someone pressed a button! Alert the mainframe!')
         
         text = self%texts(24)  ! Queue text
         CALL BUILD_QUEUE_MENU(self, markup)
      END SUBROUTINE

      SUBROUTINE HANDLE_COMPLETE_ORDER(self, data, text, markup)
         ! Completing orders: The FORTRAN way
         ! Warning: May cause unexpected time travel
         TYPE(BARMAN), INTENT(IN) :: self
         CHARACTER(LEN=*), INTENT(IN) :: data
         CHARACTER(LEN=*), INTENT(OUT) :: text
         TYPE(INLINE_BUTTON), DIMENSION(:), ALLOCATABLE, INTENT(OUT) :: markup
         
         TYPE(ORDER) :: order
         CHARACTER(LEN=1000) :: temp_str
         
         ! Get order by date
         ! In Python: one line
         ! In FORTRAN: an adventure
         CALL GET_ORDER_BY_DATE(self%db, data(11:), order)
         
         ! Update order status
         ! This would be elegant in Python
         order%barman_id = self%tg_user_id
         order%status = 'COMPLETED'
         CALL UPDATE_ORDER(self%db, order)
         
         ! Format output text
         ! String formatting in FORTRAN is pure joy (not)
         WRITE(text, '(A)') 'Order completed!!!'//NEW_LINE('A')// &
                           'From: '//TRIM(order%date)//NEW_LINE('A')// &
                           'Product: '//TRIM(order%product)//NEW_LINE('A')// &
                           'Customer ID: '//TRIM(order%customer_id)//NEW_LINE('A')// &
                           'Barman ID: '//TRIM(order%barman_id)//NEW_LINE('A')// &
                           'Status: '//TRIM(order%status)
      END SUBROUTINE

      FUNCTION ON_BUTTON_TAP(self, data) RESULT(response)
         ! Button tap handler
         ! Or as we call it: The Maze Runner
         TYPE(BARMAN), INTENT(IN) :: self
         CHARACTER(LEN=*), INTENT(IN) :: data
         TYPE(RESPONSE) :: response
         
         ! First try parent handler
         ! If it fails, it's our problem now
         CALL SUPER_ON_BUTTON_TAP(self, data, response)
         
         IF (response%text /= 'Err0r') THEN
            RETURN
         END IF
         
         ! Handle our specific buttons
         ! May cause unexpected quantum effects
         SELECT CASE (TRIM(data))
            CASE (self%texts(42))  ! Queue button
               CALL HANDLE_QUEUE_BUTTON(self, response%text, response%markup)
            CASE DEFAULT
               IF (data(1:9) == 'complete_') THEN
                  CALL HANDLE_PRE_COMPLETE_ORDER(self, data, response)
               ELSE IF (data(1:10) == 'ccomplete_') THEN
                  CALL HANDLE_COMPLETE_ORDER(self, data, response)
               ELSE
                  response%text = 'Err0r'
                  CALL BUILD_MENU(self, response%markup)
               END IF
         END SELECT
      END FUNCTION

      END MODULE BARMAN_MODULE