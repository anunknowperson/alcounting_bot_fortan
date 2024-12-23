MODULE CUSTOMER_MODULE
      ! Welcome to the CUSTOMER management system
      ! Written in FORTRAN because we hate ourselves
      ! Last updated: When dinosaurs roamed the Earth
      
      USE ISO_FORTRAN_ENV
      IMPLICIT NONE  ! Because we're not savages
      
      ! Types that would be so much easier in Python
      TYPE PRODUCT
         CHARACTER(LEN=100) :: name
         CHARACTER(LEN=1000) :: description
         INTEGER :: price     ! In Soviet Russia, price types you!
      END TYPE PRODUCT
      
      TYPE ORDER
         CHARACTER(LEN=100) :: date
         CHARACTER(LEN=100) :: product
         INTEGER :: customer_id
         INTEGER :: barman_id
         CHARACTER(LEN=50) :: status
      END TYPE ORDER
      
      TYPE BUTTON
         ! Trying to implement Telegram buttons in FORTRAN
         ! This is what madness looks like
         CHARACTER(LEN=100) :: text
         CHARACTER(LEN=100) :: callback_data
      END TYPE BUTTON
      
      TYPE CUSTOMER
         ! The most complex FORTRAN type since punch cards
         INTEGER :: tg_user_id
         TYPE(DATABASE) :: db  ! Nobody knows what's inside
         CHARACTER(LEN=1000), DIMENSION(100) :: texts  ! Array of suffering
         TYPE(BUTTON), DIMENSION(1) :: back_to_menu_button
      END TYPE CUSTOMER
      
      CONTAINS
      
      SUBROUTINE INITIALIZE_CUSTOMER(self, db, tg_user_id, texts)
         ! Initialize customer... or initialize pain?
         TYPE(CUSTOMER), INTENT(INOUT) :: self
         TYPE(DATABASE), INTENT(IN) :: db
         INTEGER, INTENT(IN) :: tg_user_id
         CHARACTER(LEN=*), DIMENSION(:), INTENT(IN) :: texts
         
         ! Copy everything because FORTRAN loves copying
         self%db = db
         self%tg_user_id = tg_user_id
         self%texts = texts
         
         ! Create back button
         ! Warning: May cause temporal paradoxes
         CALL CREATE_BUTTON(self%back_to_menu_button(1), &
                          self%texts(42), &  ! Magic number alert!
                          self%texts(42))    ! Same magic number, twice the fun!
      END SUBROUTINE
      
      SUBROUTINE CREATE_CUSTOMER_MENU_BUTTONS(self, buttons)
         ! Create menu buttons
         ! Or as we call it: The Array of Doom
         TYPE(CUSTOMER), INTENT(IN) :: self
         TYPE(BUTTON), DIMENSION(:), ALLOCATABLE, INTENT(OUT) :: buttons
         
         ! Allocate array for buttons
         ! Prayer recommended before proceeding
         ALLOCATE(buttons(3))  ! Hard-coded because we live dangerously
         
         ! Create buttons that would be one line each in Python
         CALL CREATE_BUTTON(buttons(1), self%texts(1), self%texts(1))
         CALL CREATE_BUTTON(buttons(2), self%texts(2), self%texts(2))
         CALL CREATE_BUTTON(buttons(3), self%texts(3), self%texts(3))
      END SUBROUTINE
      
      SUBROUTINE BUILD_SHOW_PRODUCTS_MENU(self, markup)
         ! Build products menu
         ! Warning: May cause compiler to cry
         TYPE(CUSTOMER), INTENT(IN) :: self
         TYPE(BUTTON), DIMENSION(:), ALLOCATABLE, INTENT(OUT) :: markup
         
         TYPE(PRODUCT), DIMENSION(100) :: products  ! Fixed size arrays forever!
         INTEGER :: num_products, i
         
         ! Get products from database
         ! What could possibly go wrong?
         CALL GET_ALL_PRODUCTS(self%db, products, num_products)
         
         IF (num_products > 0) THEN
            ! Create buttons for each product
            ! This would be a list comprehension in Python
            ! Here it's just pain
            ALLOCATE(markup(num_products + 1))
            DO i = 1, num_products
               CALL CREATE_BUTTON(markup(i), &
                                TRIM(products(i)%name), &
                                'shown_'//TRIM(products(i)%name))
            END DO
            markup(num_products + 1) = self%back_to_menu_button(1)
         ELSE
            ! No products? Time for lunch break
            CALL LOG_MESSAGE('No products found. Blame the mainframe.')
            ALLOCATE(markup(1))
            markup(1) = self%back_to_menu_button(1)
         END IF
      END SUBROUTINE
      
      SUBROUTINE HANDLE_PRODUCT_INFO(self, data, text, markup)
         ! Handle product info
         ! Warning: Contains string manipulation
         TYPE(CUSTOMER), INTENT(IN) :: self
         CHARACTER(LEN=*), INTENT(IN) :: data
         CHARACTER(LEN=*), INTENT(OUT) :: text
         TYPE(BUTTON), DIMENSION(:), ALLOCATABLE, INTENT(OUT) :: markup
         
         TYPE(PRODUCT) :: product
         
         ! Get product info
         ! Hold your breath, here comes FORTRAN string handling
         CALL GET_PRODUCT_BY_NAME(self%db, data(6:), product)
         
         ! Format text
         ! This would be an f-string in Python
         ! Here it's... well... this
         WRITE(text, '(A)') '<b>'//TRIM(product%name)//'</b>'//NEW_LINE('A')// &
                           '<b>Description:</b>'//NEW_LINE('A')// &
                           TRIM(product%description)//NEW_LINE('A')// &
                           '<b>Price:</b> '//TRIM(str(product%price))//' rubles'
         
         ! Build menu
         CALL BUILD_SHOW_PRODUCT_INFO_MENU(self, data, markup)
      END SUBROUTINE
      
      FUNCTION ON_BUTTON_TAP(self, data) RESULT(response)
         ! The main event handler
         ! Or as we call it: The Spaghetti Factory
         TYPE(CUSTOMER), INTENT(IN) :: self
         CHARACTER(LEN=*), INTENT(IN) :: data
         TYPE(RESPONSE) :: response
         
         ! Get all order dates
         ! Because who needs dynamic arrays?
         CHARACTER(LEN=100), DIMENSION(1000) :: orders_dates
         INTEGER :: num_orders
         
         ! Check all possible button types
         ! This would be a dictionary in Python
         ! Here it's a SELECT CASE of doom
         SELECT CASE (TRIM(data))
            CASE (self%texts(1))  ! Show products
               CALL HANDLE_SHOW_PRODUCTS(self, response)
            CASE (self%texts(2))  ! Make order
               CALL HANDLE_MAKE_ORDER(self, response)
            CASE (self%texts(3))  ! Show orders
               CALL HANDLE_SHOW_ORDERS(self, response)
            CASE (self%texts(42))  ! Back to menu
               CALL BACK_TO_MENU(self, response)
            CASE DEFAULT
               ! Check prefixes
               ! String handling in FORTRAN is pure joy (not)
               IF (data(1:6) == 'shown_') THEN
                  CALL HANDLE_PRODUCT_INFO(self, data, response)
               ELSE IF (data(1:6) == 'chose_') THEN
                  CALL HANDLE_PRE_APPROVE_ORDER(self, data, response)
               ELSE IF (data(1:10) == 'nextchose_') THEN
                  CALL HANDLE_APPROVE_ORDER(self, data, response)
               ELSE
                  ! Something went wrong
                  ! Probably cosmic rays
                  response%text = 'Err0r'
                  CALL BUILD_MENU(self, response%markup)
               END IF
         END SELECT
      END FUNCTION
      
      END MODULE CUSTOMER_MODULE