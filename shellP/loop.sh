## 1.Loop:
        - It allows you to execute a block of code repeatedly based on a condition or 
        - a set of values, enabling automation and iteration through data efficiently.

  # While Loop : It run the statements only if the condition is true.
   syntax:
          while [condition]
          do
             statement(s)
          done 

    EX: while.sh
     #!/bin/bash
     #- print number 1 - 9 #

     count=1
     while [ $count -le 9]
     do 
       echo "count = $count"
       count= expr $count + 1
     done

     echo "-- EOS --"  

#2. Until Loop: It run the statements until the condition becomes true.
   Syntax:
           until [condition]
           do 
            statemen(s)
           done  

    Ex: until.sh
       #!/bin/bash
       a=13   #change the value to 1 & try
       until [ $a -lt 10 ]
       do 
         echo "a=$a"
         a= expr $a 1 1
        done
        
#3. For Loop: Number of iterations depending on a list of value
    Syntax:
           for variable in val1 val2 val3
           do
             statement(s)
            done
    
    EX:
       #!/bin/sh
       for i in 1 2 3 4 5 
       do 
         echo "Looping .... number $i"
       done

 
 #4. Nested Loop:
                Oupt:
                     *
                     * *
                     * * *
                     * * * *
                     * * * * *
                     -----------
                     * * * * *
                     * * * *
                     * * * 
                     * * 
                     *
    EX:
       #!/bin/bash
        
        a=0
        b=0

        while [ $a -lt 5 ]
        do
          b=1
          char= "*"
          while [ $b -le $a ]
          do
             char="* $char"
             b= 'expr $b + 1'
          done

          echo "$char"
          a= 'expr $a + 1'
          done
          echo "--------------"

           until [ $a -lt 0 ]
           do
             c=1
             char="*"
               while [ $c -lt $a ]
                do
                 char="* $char"
                 c= expr $c + 1
                done
                echo "$char"
                a= expr '$a -1'
            done 


# EX: Loop with conditions

 #!/bin/bash 
 #- print average of give numbers -#

 sum=0
 ans="y"
 count=0

 while [ $ans == "y" ]
 do
  if [ $count -ne 0 ]; then
    read -p "Do you want to couninue (y/n):" ans
  fi 

  if [ $ans == "y" ]; then
     read -p  "Enter a number:" num
     sum= expr $sum + $num
     count= 'expr $count + 1'
   fi
 done
 if [ $count -lt 2 ]; then
     echo "you need  atleast 2 values for the average"
 else
    avg = 'expr $sum / $count'
    echo "Average =$avg "
 fi 

 



 
    
