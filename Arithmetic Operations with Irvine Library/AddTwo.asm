;----------------------------------------------------------------------
; MASM: A barebones template for Assembly Programming
; Created By: Florida Rwejuna
;Program Name: AddTwoSubTwo
; Strategy Program Description: Use user input and a random number to add and subtract them using the Irvine Library
;Date: 9/1/2023
;----------------------------------------------------------------------

INCLUDE Irvine32.inc

.data
InquiredUserValue BYTE "Enter the User Value: ", 0											; Asking the user to input the desired value
resultValue BYTE "Result = ", 0																; Result statement

userValue   DWORD ?						; Declaring a variable for the user input value
randomValue DWORD ?						; Decalaring a variable for the random value generated
result      DWORD ?						; Declaring the variable for the result


.code
main PROC

mov edx, OFFSET InquiredUserValue		; Storing the statement for the user
call WriteString						; Displaying the user inquiry
call ReadInt							; Reads input from the user
mov userValue, eax						; Storing value from the user for later use


		; Generating a range between 1-100
		mov eax, 1
		mov ebx, 100
		call Randomize					; Random number being called everytime
		mov randomValue, eax			; Storing the random value into eax register

		mov eax,randomValue				; Copies the value of eax to be used
		call WriteDec					; Displaying the random number
		call Crlf						; Space
		
		mov eax, userValue				; Stored value from the user is moved to register eax
		add eax, randomValue			; Summing the random number and the user input
		mov result, eax					; The result is stored in the register eax
		

		mov edx, OFFSET resultValue		; Calls the result text
		call WriteString				; Display the result statement and value
		mov eax, result					; Copy the value stored in ax to result
		call WriteInt					; Prints the result value
		call Crlf						; Space

		mov eax, userValue				; Stored value from the user is moved to regeister eax
		sub eax, randomValue			; Summing the random number and the user input
		mov result, eax					; The result is stored in the register eax

		mov edx, OFFSET resultValue		; Calls the result text
		call WriteString				; Display the result statement and value
		mov eax, result					; Copy the value stored in ax to result
		call WriteInt					; Prints the result value
		call Crlf						; Space


 

	exit

main ENDP
END main