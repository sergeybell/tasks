program prime_num
implicit none
interface	!interface section (declare external function )
	integer function isprime (num)
			integer num
			integer dev
	end function isprime
end interface

integer, allocatable:: a(:,:)
integer fin_num, i!, flag
integer ar_size

read (*,*) ar_size
allocate (a(ar_size,2))
a=reshape((/(i,i=1,ar_size*2)/),shape(a))
!a=1
read (*,*)
deallocate (a)



	!write (*,*) real(15),sqrt(real(15)), int(sqrt(real(15)))
	write (*,"(A,$)") 'waiting for upper limit to look for prime numbers: '; read (*,*) fin_num
	
	if (fin_num<3) then
	write (*,*) 'invalid fin_num. Quiting'
	else
		do i=3,fin_num,2	
		!flag=isprime(i)
			if (isprime(i)==1) then
			write (*,*) 'appropriate prime number ', i
			!else
			!write (*,*)  " isn't appropriate number", i, flag
			end if
			
		end do
	endif

end

!contains !(no contains block for external function) 
	integer function isprime (num)
		integer num
		integer dev
		do dev=3,int(sqrt(real(num))),2
			if (mod(num,dev)==0) then
			isprime=-1
			return
			
			end if
		end do
		isprime =1
		return
		
	end function isprime

