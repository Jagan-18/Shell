#Variable –
        # This nothing but a place in the memory in which some values is stored so that you can 
        # reuse whenever you want, or you can change the value whatever is needed.


1 Define a varible: variable_name=value
2. Retrieve the value from variable: $variable_name
3. Variable Types: 
                 1. Local Variables :Local variables are scoped to a function or script,
                 2. Environment Variables:  while environment variables are accessible globally across processes and sessions.




    Ex: myname='jagadeesh'
        myage= 26
        var1=10
        today1='saturday'
        my_name='reddy'
         
          $myname
          $myage
          $my_name
          $today1
          $var1

    Ex: 2
           step1: vim variable.sh
            step2: 
                   #!/bin/bash

                    name="jagadeesh"
                    var=26
   
                    echo "My name is $name"
                     echo "Today date is $var"

            Step3: :wq!
            step4: chmode +x variable .sh
            step5: ./variable.sh 
    
    Ex:3 vim local_variables.sh
         #!/bin/bash
         #----------------------------------
         # Authore: Jagadeesh
         # Date: 21-09-24
         #virsion: v1
         #---------------------------

         var=10
         echo "value of var first time = $var"

         var=20
         echo "value of var second time = $var" 
          


## Special Variables:
                     • $0 -    Return file name of the script.
                     • $n -    Command line arguments, n is a value from 1-9
                     • $# -    Return total number of arguments.
                     • $? -    Exit value or status of last command run.
                     • $$ -    Returns the process ID of the script.
                     • $@ -    List of parameters given to script.
                     • $1,$2 - Parameter 1, 2 and so on..
                     • shift - Number of argument are reduced each time as the shift command executes.
                     • These variables are shell variables and only valid to the current shell.
      

    Ex:
      - vim special_vars.sh
          #!/bin/bash
          echo "File name \$0 : $0"
          echo "Total number of arguments passed \$# : $#"
          echo "All the arguments \$@  : $@"

          echo "-- -- -- --"
          echo "First argument \$1     : $1"
          echo "Seconed argument \$2   : $2"
          echo "Thrid argument \$3     : $3"
          echo "Fourth argument \$4    : $4"
          echo "Fifth argument \$5     : $5"
          echo "sixth argument \$6     : $6"
          echo "Seventh argument \$7   : $7"
          echo "Eigth argument \$8     : $8"
          echo "Ninth argument \$9     : $9"
       
          echo "-- -- -- --"
          echo "Exit status of the previous command \$? : $?"
          echo "Process ID of the current script \$$ : $$"

          echo "-- -- -- --"
          shift
          echo "Total number of arguments after shift \$# : $#"
          echo "All the argument \$@ :   $@"
          echo "First argument \$1   :   $1"
          echo  "Ninth argument \$9  :   $9"
    
        - ./ special_vars.sh 1 2 3 4 5 6 7 8 9

    ## output:
          File name $0 :  ./special_vars.sh
          Total number of arguments passed $# : 9
          All the arguments $@  : 1 2 3 4 5 6 7 8 9

          -- -- -- --
          First argument $1     : 1
          Seconed argument $2   : 2
          Thrid argument $3     : 3
          Fourth argument $4    : 4
          Fifth argument $5     : 5
          sixth argument $6     : 6
          Seventh argument $7   : 7
          Eigth argument $8     : 8
          Ninth argument $9     : 9
       
          -- -- -- --
          Exit status of the previous command $? : 0
          Process ID of the current script $$ : 4318

          -- -- -- --
    
          Total number of arguments after shift $# : 8 
          All the argument $@ :   2 3 4 5 6 7 8 9
          First argument $1   :   2 
          Ninth argument $9   :   
 

 # set -vx : It's enables verbose and debug modes, printing each command and its expanded arguments before execution, aiding in debugging
           
    









    
